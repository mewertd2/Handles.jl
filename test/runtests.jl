# Copyright 2019 Digital Domain 3.0
#
# Licensed under the Apache License, Version 2.0 (the "Apache License")
# with the following modification; you may not use this file except in
# compliance with the Apache License and the following modification to it:
# Section 6. Trademarks. is deleted and replaced with:
#
# 6. Trademarks. This License does not grant permission to use the trade
#    names, trademarks, service marks, or product names of the Licensor
#    and its affiliates, except as required to comply with Section 4(c) of
#    the License and to reproduce the content of the NOTICE file.
#
# You may obtain a copy of the Apache License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the Apache License with the above modification is
# distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied. See the Apache License for the specific
# language governing permissions and limitations under the Apache License.

using Test
using Handles

@HandleType Foo
@HandleType Bar
@HandleType Baz

hey(x::Integer) = x+1
hey(x::Foo) = string("foo", x)
hey(x::Bar) = string("bar", x)

@testset "handles" begin
  @test Foo(1) == 1

  a = sort(map( f->f+1 + Foo(1), (2 .* Foo.([10:-1:-2...]))))
  @test eltype(a) == Foo
  @test a[1] == -2 == Foo(-2)
  @test a[2] < a[3]
  @test a[end] == 22

  @test hey(Foo(2)) == "foo2"
  @test hey(Bar(3)) == "bar3"
  @test hey(Baz(4)) == 5

end

