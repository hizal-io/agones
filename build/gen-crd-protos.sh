echo "Generating protos"
#pushd /go/src/k8s.io/code-generator && go install k8s.io/code-generator/cmd/go-to-protobuf && popd

# To support running this script from anywhere, first cd into this directory,
# and then install with forced module mode on and fully qualified name.
cd "$(dirname "${0}")"
cd ..

go install golang.org/x/tools/cmd/goimports@v0.1.7
go install k8s.io/code-generator/cmd/go-to-protobuf@v0.24.1

$GOPATH/bin/go-to-protobuf \
  		--go-header-file=build/boilerplate.go.txt \
  		--packages=agones.dev/agones/pkg/apis/agones/v1,agones.dev/agones/pkg/apis/autoscaling/v1 \
  		--apimachinery-packages=-k8s.io/apimachinery/pkg/util/intstr,+k8s.io/apimachinery/pkg/api/resource,-k8s.io/apimachinery/pkg/apis/meta/v1,-k8s.io/api/core/v1,-k8s.io/api/apps/v1,-k8s.io/apimachinery/pkg/runtime/schema \
  		--proto-import=${GOPATH}/src/agones.dev/agones/vendor \
  		--proto-import=${GOPATH}/pkg/mod

# go install k8s.io/code-generator/cmd/go-to-protobuf@v0.21.5
# git clone git@github.com:hizal-io/agones.git $GOPATH/src/agones.dev/agones
# git remote add upstream git@github.com:googleforgames/agones.git
