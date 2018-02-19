import LLVM
import XCTest
import FileCheck
import Foundation

class IRGlobalSpec : XCTestCase {
  func testIRInertGlobal() {
    XCTAssert(fileCheckOutput(of: .stderr, withPrefixes: ["IRINERTGLOBAL"]) {
      // IRINERTGLOBAL: ; ModuleID = '[[ModuleName:IRInertGlobalTest]]'
      // IRINERTGLOBAL-NEXT: source_filename = "[[ModuleName]]"
      let module = Module(name: "IRInertGlobalTest")
      let builder = IRBuilder(module: module)
      // IRINERTGLOBAL: @external_global = external constant i32
      var extGlobal = builder.addGlobal("external_global", type: IntType.int32)
      extGlobal.isGlobalConstant = true
      // IRINERTGLOBAL: @got.external_global = private unnamed_addr constant i32* @external_global
      var gotGlobal = builder.addGlobal("got.external_global",
                                        initializer: extGlobal)
      gotGlobal.linkage = .`private`
      gotGlobal.unnamedAddressKind = .global
      gotGlobal.isGlobalConstant = true

      // IRINERTGLOBAL: @external_relative_reference = global i32 trunc (i64 sub (i64 ptrtoint (i32** @got.external_global to i64), i64 ptrtoint (i32* @external_relative_reference to i64)) to i32)
      var ext_relative_reference = builder.addGlobal("external_relative_reference", type: IntType.int32)
      ext_relative_reference.initializer = const.trunc(const.sub(const.ptrToInt(gotGlobal, to: .int64), const.ptrToInt(ext_relative_reference, to: .int64)), to: .int32)
      module.dump()
    })
  }

  #if !os(macOS)
  static var allTests = testCase([
    ("testIRInertGlobal", testIRInertGlobal),
  ])
  #endif
}

