echo "Generating protos"
#pushd /go/src/k8s.io/code-generator && go install k8s.io/code-generator/cmd/go-to-protobuf && popd

# To support running this script from anywhere, first cd into this directory,
# and then install with forced module mode on and fully qualified name.
cd "$(dirname "${0}")"
cd ..

go install golang.org/x/tools/cmd/goimports@v0.10.0
go install k8s.io/code-generator/cmd/go-to-protobuf@v0.27.3
go install github.com/gogo/protobuf/protoc-gen-gogo@v1.3.2

$GOPATH/bin/go-to-protobuf \
  		--go-header-file=build/boilerplate.go.txt \
  		--packages=agones.dev/agones/pkg/apis/agones/v1 \
  		--apimachinery-packages=-k8s.io/apimachinery/pkg/util/intstr,-k8s.io/apimachinery/pkg/api/resource,-k8s.io/apimachinery/pkg/apis/meta/v1,-k8s.io/api/core/v1,-k8s.io/api/apps/v1,-k8s.io/apimachinery/pkg/runtime/schema \
  		--proto-import=${PWD}/vendor

$GOPATH/bin/go-to-protobuf \
  		--go-header-file=build/boilerplate.go.txt \
  		--packages=agones.dev/agones/pkg/apis/autoscaling/v1,-agones.dev/agones/pkg/apis/agones/v1=agones.v1 \
  		--apimachinery-packages=-k8s.io/apimachinery/pkg/util/intstr,-k8s.io/apimachinery/pkg/api/resource,-k8s.io/apimachinery/pkg/apis/meta/v1,-k8s.io/api/core/v1,-k8s.io/api/apps/v1,-k8s.io/apimachinery/pkg/runtime/schema,-k8s.io/api/admissionregistration/v1,-k8s.io/apimachinery/pkg/runtime \
  		--proto-import=${PWD}/vendor

# go install k8s.io/code-generator/cmd/go-to-protobuf@v0.21.5
# git clone git@github.com:hizal-io/agones.git $GOPATH/src/agones.dev/agones
# git remote add upstream git@github.com:googleforgames/agones.git
