
import cllvm

public enum const {

  public static func alignOf(_ ty: IRType) -> LLVMValueRef {
    return LLVMAlignOf(ty.asLLVM())
  }

  public static func sizeOf(_ ty: IRValue) -> LLVMValueRef {
    return LLVMSizeOf(ty.asLLVM())
  }

  public static func neg(_ val: IRValue) -> LLVMValueRef {
    assert(val.isConstant)
    return LLVMConstNeg(val.asLLVM())
  }

  public static func nswNeg(_ val: IRValue) -> LLVMValueRef {
    assert(val.isConstant)
    return LLVMConstNSWNeg(val.asLLVM())
  }

  public static func nuwNeg(_ val: IRValue) -> LLVMValueRef {
    assert(val.isConstant)
    return LLVMConstNUWNeg(val.asLLVM())
  }

  public static func fNeg(_ val: IRValue) -> LLVMValueRef {
    assert(val.isConstant)
    return LLVMConstFNeg(val.asLLVM())
  }

  public static func not(_ val: IRValue) -> LLVMValueRef {
    assert(val.isConstant)
    return LLVMConstNot(val.asLLVM())
  }

  public static func add(_ l: IRValue, _ r: IRValue) -> LLVMValueRef {
    assert(l.isConstant && r.isConstant)
    return LLVMConstAdd(l.asLLVM(), r.asLLVM())
  }

  public static func nswAdd(_ l: IRValue, _ r: IRValue) -> LLVMValueRef {
    assert(l.isConstant && r.isConstant)
    return LLVMConstNSWAdd(l.asLLVM(), r.asLLVM())
  }

  public static func nuwAdd(_ l: IRValue, _ r: IRValue) -> LLVMValueRef {
    assert(l.isConstant && r.isConstant)
    return LLVMConstNUWAdd(l.asLLVM(), r.asLLVM())
  }

  public static func fAdd(_ l: IRValue, _ r: IRValue) -> LLVMValueRef {
    assert(l.isConstant && r.isConstant)
    return LLVMConstFAdd(l.asLLVM(), r.asLLVM())
  }

  public static func sub(_ l: IRValue, _ r: IRValue) -> LLVMValueRef {
    assert(l.isConstant && r.isConstant)
    return LLVMConstSub(l.asLLVM(), r.asLLVM())
  }

  public static func nswSub(_ l: IRValue, _ r: IRValue) -> LLVMValueRef {
    assert(l.isConstant && r.isConstant)
    return LLVMConstNSWSub(l.asLLVM(), r.asLLVM())
  }

  public static func nuwSub(_ l: IRValue, _ r: IRValue) -> LLVMValueRef {
    assert(l.isConstant && r.isConstant)
    return LLVMConstNUWSub(l.asLLVM(), r.asLLVM())
  }

  public static func fSub(_ l: IRValue, _ r: IRValue) -> LLVMValueRef {
    assert(l.isConstant && r.isConstant)
    return LLVMConstFSub(l.asLLVM(), r.asLLVM())
  }

  public static func mul(_ l: IRValue, _ r: IRValue) -> LLVMValueRef {
    assert(l.isConstant && r.isConstant)
    return LLVMConstMul(l.asLLVM(), r.asLLVM())
  }

  public static func nswMul(_ l: IRValue, _ r: IRValue) -> LLVMValueRef {
    assert(l.isConstant && r.isConstant)
    return LLVMConstNSWMul(l.asLLVM(), r.asLLVM())
  }

  public static func nuwMul(_ l: IRValue, _ r: IRValue) -> LLVMValueRef {
    assert(l.isConstant && r.isConstant)
    return LLVMConstNUWMul(l.asLLVM(), r.asLLVM())
  }

  public static func fMul(_ l: IRValue, _ r: IRValue) -> LLVMValueRef {
    assert(l.isConstant && r.isConstant)
    return LLVMConstFMul(l.asLLVM(), r.asLLVM())
  }

  public static func uDiv(_ l: IRValue, _ r: IRValue) -> LLVMValueRef {
    assert(l.isConstant && r.isConstant)
    return LLVMConstUDiv(l.asLLVM(), r.asLLVM())
  }

  public static func exactUDiv(_ l: IRValue, _ r: IRValue) -> LLVMValueRef {
    assert(l.isConstant && r.isConstant)
    return LLVMConstExactUDiv(l.asLLVM(), r.asLLVM())
  }

  public static func sDiv(_ l: IRValue, _ r: IRValue) -> LLVMValueRef {
    assert(l.isConstant && r.isConstant)
    return LLVMConstSDiv(l.asLLVM(), r.asLLVM())
  }

  public static func exactSDiv(_ l: IRValue, _ r: IRValue) -> LLVMValueRef {
    assert(l.isConstant && r.isConstant)
    return LLVMConstExactSDiv(l.asLLVM(), r.asLLVM())
  }

  public static func fDiv(_ l: IRValue, _ r: IRValue) -> LLVMValueRef {
    assert(l.isConstant && r.isConstant)
    return LLVMConstFDiv(l.asLLVM(), r.asLLVM())
  }

  public static func uRem(_ l: IRValue, _ r: IRValue) -> LLVMValueRef {
    assert(l.isConstant && r.isConstant)
    return LLVMConstURem(l.asLLVM(), r.asLLVM())
  }

  public static func sRem(_ l: IRValue, _ r: IRValue) -> LLVMValueRef {
    assert(l.isConstant && r.isConstant)
    return LLVMConstSRem(l.asLLVM(), r.asLLVM())
  }

  public static func fRem(_ l: IRValue, _ r: IRValue) -> LLVMValueRef {
    assert(l.isConstant && r.isConstant)
    return LLVMConstFRem(l.asLLVM(), r.asLLVM())
  }

  public static func and(_ l: IRValue, _ r: IRValue) -> LLVMValueRef {
    assert(l.isConstant && r.isConstant)
    return LLVMConstAnd(l.asLLVM(), r.asLLVM())
  }

  public static func or(_ l: IRValue, _ r: IRValue) -> LLVMValueRef {
    assert(l.isConstant && r.isConstant)
    return LLVMConstOr(l.asLLVM(), r.asLLVM())
  }

  public static func xor(_ l: IRValue, _ r: IRValue) -> LLVMValueRef {
    assert(l.isConstant && r.isConstant)
    return LLVMConstXor(l.asLLVM(), r.asLLVM())
  }

  public static func iCmp(_ predicate: LLVMIntPredicate, _ l: IRValue, _ r: IRValue) -> LLVMValueRef {
    assert(l.isConstant && r.isConstant)
    return LLVMConstICmp(predicate, l.asLLVM(), r.asLLVM())
  }

  public static func fCmp(_ predicate: LLVMRealPredicate, _ l: IRValue, _ r: IRValue) -> LLVMValueRef {
    assert(l.isConstant && r.isConstant)
    return LLVMConstFCmp(predicate, l.asLLVM(), r.asLLVM())
  }

  public static func shl(_ l: IRValue, _ r: IRValue) -> LLVMValueRef {
    assert(l.isConstant && r.isConstant)
    return LLVMConstShl(l.asLLVM(), r.asLLVM())
  }

  public static func lShr(_ l: IRValue, _ r: IRValue) -> LLVMValueRef {
    assert(l.isConstant && r.isConstant)
    return LLVMConstLShr(l.asLLVM(), r.asLLVM())
  }

  public static func aShr(_ l: IRValue, _ r: IRValue) -> LLVMValueRef {
    assert(l.isConstant && r.isConstant)
    return LLVMConstAShr(l.asLLVM(), r.asLLVM())
  }

  public static func gep(_ val: IRValue, indices: [IRValue]) -> LLVMValueRef {
    assert(val.isConstant)
    var indices = indices.map({ Optional($0.asLLVM()) })
    return indices.withUnsafeMutableBufferPointer { buf in
      return LLVMConstGEP(val.asLLVM(), buf.baseAddress, UInt32(buf.count))
    }
  }

  public static func inBoundsGEP(_ val: IRValue, indices: [IRValue]) -> LLVMValueRef {
    assert(val.isConstant)
    var indices = indices.map({ Optional($0.asLLVM()) })
    return indices.withUnsafeMutableBufferPointer { buf in
      return LLVMConstInBoundsGEP(val.asLLVM(), buf.baseAddress, UInt32(buf.count))
    }
  }

  public static func trunc(_ val: IRValue, to targetType: IntType) -> LLVMValueRef {
    assert(val.isConstant)
    return LLVMConstTrunc(val.asLLVM(), targetType.asLLVM())
  }

  public static func sExt(_ val: IRValue, to targetType: IntType) -> LLVMValueRef {
    assert(val.isConstant)
    return LLVMConstSExt(val.asLLVM(), targetType.asLLVM())
  }

  public static func zExt(_ val: IRValue, to targetType: IntType) -> LLVMValueRef {
    assert(val.isConstant)
    return LLVMConstZExt(val.asLLVM(), targetType.asLLVM())
  }

  public static func fpTrunc(_ val: IRValue, to targetType: FloatType) -> LLVMValueRef {
    assert(val.isConstant)
    return LLVMConstFPTrunc(val.asLLVM(), targetType.asLLVM())
  }

  public static func fpExt(_ val: IRValue, to targetType: FloatType) -> LLVMValueRef {
    assert(val.isConstant)
    return LLVMConstFPExt(val.asLLVM(), targetType.asLLVM())
  }

  public static func uiToFP(_ val: IRValue, to targetType: FloatType) -> LLVMValueRef {
    assert(val.isConstant)
    return LLVMConstUIToFP(val.asLLVM(), targetType.asLLVM())
  }

  public static func siToFP(_ val: IRValue, to targetType: FloatType) -> LLVMValueRef {
    assert(val.isConstant)
    return LLVMConstSIToFP(val.asLLVM(), targetType.asLLVM())
  }

  public static func fpToUI(_ val: IRValue, to targetType: IntType) -> LLVMValueRef {
    assert(val.isConstant)
    return LLVMConstFPToUI(val.asLLVM(), targetType.asLLVM())
  }

  public static func fpToSI(_ val: IRValue, to targetType: IntType) -> LLVMValueRef {
    assert(val.isConstant)
    return LLVMConstFPToSI(val.asLLVM(), targetType.asLLVM())
  }

  public static func ptrToInt(_ val: IRValue, to targetType: IntType) -> LLVMValueRef {
    assert(val.isConstant)
    return LLVMConstPtrToInt(val.asLLVM(), targetType.asLLVM())
  }

  public static func intToPtr(_ val: IRValue, to targetType: PointerType) -> LLVMValueRef {
    assert(val.isConstant)
    return LLVMConstIntToPtr(val.asLLVM(), targetType.asLLVM())
  }

  public static func bitCast(_ val: IRValue, to targetType: IRType) -> LLVMValueRef {
    assert(val.isConstant)
    return LLVMConstBitCast(val.asLLVM(), targetType.asLLVM())
  }

  public static func addrSpaceCast(_ val: IRValue, to targetType: IRType) -> LLVMValueRef {
    assert(val.isConstant)
    return LLVMConstAddrSpaceCast(val.asLLVM(), targetType.asLLVM())
  }

  public static func zextOrBitCast(_ val: IRValue, to targetType: IRType) -> LLVMValueRef {
    assert(val.isConstant)
    return LLVMConstZExtOrBitCast(val.asLLVM(), targetType.asLLVM())
  }

  public static func sextOrBitCast(_ val: IRValue, to targetType: IRType) -> LLVMValueRef {
    assert(val.isConstant)
    return LLVMConstSExtOrBitCast(val.asLLVM(), targetType.asLLVM())
  }

  public static func truncOrBitCast(_ val: IRValue, to targetType: IRType) -> LLVMValueRef {
    assert(val.isConstant)
    return LLVMConstTruncOrBitCast(val.asLLVM(), targetType.asLLVM())
  }

  public static func pointerCast(_ val: IRValue, to targetType: IRType) -> LLVMValueRef {
    assert(val.isConstant)
    return LLVMConstPointerCast(val.asLLVM(), targetType.asLLVM())
  }

  public static func intCast(_ val: IRValue, to targetType: IRType, _ isSigned: Bool) -> LLVMValueRef {
    assert(val.isConstant)
    return LLVMConstIntCast(val.asLLVM(), targetType.asLLVM(), isSigned.llvm)
  }

  public static func fPCast(_ val: IRValue, to targetType: IRType) -> LLVMValueRef {
    assert(val.isConstant)
    return LLVMConstFPCast(val.asLLVM(), targetType.asLLVM())
  }

  public static func select(condition: IRValue, _ ifTrue: IRValue, _ ifFalse: IRValue) -> LLVMValueRef {
    assert(condition.isConstant && ifTrue.isConstant && ifFalse.isConstant)
    return LLVMConstSelect(condition.asLLVM(), ifTrue.asLLVM(), ifFalse.asLLVM())
  }

  public static func extractElement(_ vector: IRValue, index: IRValue) -> LLVMValueRef {
    assert(vector.isConstant && index.isConstant)
    return LLVMConstExtractElement(vector.asLLVM(), index.asLLVM())
  }

  public static func insertElement(_ vector: IRValue, element: IRValue, index: IRValue) -> LLVMValueRef {
    assert(vector.isConstant && element.isConstant && index.isConstant)
    return LLVMConstInsertElement(vector.asLLVM(), element.asLLVM(), index.asLLVM())
  }

  public static func shuffleVector(_ vectorA: IRValue, _ vectorB: IRValue, mask: IRValue) -> LLVMValueRef {
    assert(vectorA.isConstant && vectorB.isConstant && mask.isConstant)
    return LLVMConstShuffleVector(vectorA.asLLVM(), vectorB.asLLVM(), mask.asLLVM())
  }

  public static func extractValue(_ aggregate: IRValue, indices: [Int]) -> LLVMValueRef {
    assert(aggregate.isConstant)
    var indices = indices.map({ UInt32($0) })
    return indices.withUnsafeMutableBufferPointer { buf in
      return LLVMConstExtractValue(aggregate.asLLVM(), buf.baseAddress, UInt32(buf.count))
    }
  }

  public static func insertValue(_ aggregate: IRValue, value: IRValue, indices: [Int]) -> LLVMValueRef {
    assert(aggregate.isConstant && value.isConstant)
    var indices = indices.map({ UInt32($0) })
    return indices.withUnsafeMutableBufferPointer { buf in
      return LLVMConstInsertValue(aggregate.asLLVM(), value.asLLVM(), buf.baseAddress, UInt32(buf.count))
    }
  }

  public static func inlineAsm(_ ty: IRType, _ asmString: String, constraints: [Int8], hasSideEffects: Bool, isAlignStack: Bool) -> LLVMValueRef {
    return LLVMConstInlineAsm(ty.asLLVM(), asmString, constraints, hasSideEffects.llvm, isAlignStack.llvm)
  }

  public static func blockAddress(_ f: Function, _ bb: BasicBlock) -> LLVMValueRef {
    return LLVMBlockAddress(f.asLLVM(), bb.asLLVM())
  }
}
