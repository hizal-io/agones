// Copyright 2022 Google LLC All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// This code was autogenerated. Do not edit directly.
// Code generated by protoc-gen-go-grpc. DO NOT EDIT.
// versions:
// - protoc-gen-go-grpc v1.2.0
// - protoc             v3.21.12
// source: beta.proto

package beta

import (
	grpc "google.golang.org/grpc"
)

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
// Requires gRPC-Go v1.32.0 or later.
const _ = grpc.SupportPackageIsVersion7

// SDKClient is the client API for SDK service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type SDKClient interface {
}

type sDKClient struct {
	cc grpc.ClientConnInterface
}

func NewSDKClient(cc grpc.ClientConnInterface) SDKClient {
	return &sDKClient{cc}
}

// SDKServer is the server API for SDK service.
// All implementations should embed UnimplementedSDKServer
// for forward compatibility
type SDKServer interface {
}

// UnimplementedSDKServer should be embedded to have forward compatible implementations.
type UnimplementedSDKServer struct {
}

// UnsafeSDKServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to SDKServer will
// result in compilation errors.
type UnsafeSDKServer interface {
	mustEmbedUnimplementedSDKServer()
}

func RegisterSDKServer(s grpc.ServiceRegistrar, srv SDKServer) {
	s.RegisterService(&SDK_ServiceDesc, srv)
}

// SDK_ServiceDesc is the grpc.ServiceDesc for SDK service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var SDK_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "agones.dev.sdk.beta.SDK",
	HandlerType: (*SDKServer)(nil),
	Methods:     []grpc.MethodDesc{},
	Streams:     []grpc.StreamDesc{},
	Metadata:    "beta.proto",
}
