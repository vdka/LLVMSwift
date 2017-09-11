#if !NO_SWIFTPM
import cllvm
#endif

/// The `IntType` represents an integral value of a specified bit width.
///
/// The `IntType` is a very simple type that simply specifies an arbitrary bit
/// width for the integer type desired. Any bit width from 1 bit to (2^23)-1
/// (about 8 million) can be specified.
public struct IntType: IRType {
  /// Retrieves the bit width of this integer type.
  public let width: Int

  /// Returns the context associated with this module.
  public let context: Context?

  /// Creates an integer type with the specified bit width.
  ///
  /// - parameter width: The width in bits of the integer type
  /// - parameter context: The context to create this type in
  /// - SeeAlso: http://llvm.org/docs/ProgrammersManual.html#achieving-isolation-with-llvmcontext
  public init(width: Int, in context: Context? = nil) {
    self.width = width
    self.context = context
  }

  /// Retrieves the `i1` type.
  public static let int1 = IntType(width: 1)
  /// Retrieves the `i8` type.
  public static let int8 = IntType(width: 8)
  /// Retrieves the `i16` type.
  public static let int16 = IntType(width: 16)
  /// Retrieves the `i32` type.
  public static let int32 = IntType(width: 32)
  /// Retrieves the `i64` type.
  public static let int64 = IntType(width: 64)
  /// Retrieves the `i128` type.
  public static let int128 = IntType(width: 128)

  /// Retrieves an integer value of this type's bit width consisting of all
  /// zero-bits.
  ///
  /// - returns: A value consisting of all zero-bits of this type's bit width.
  public func zero() -> IRValue {
    return null()
  }

  /// Creates an unsigned integer constant value with the given Swift integer value.
  ///
  /// - parameter value: A Swift integer value.
  /// - parameter signExtend: Whether to sign-extend this value to fit this
  ///   type's bit width.  Defaults to `false`.
  public func constant<IntTy: UnsignedInteger>(_ value: IntTy, signExtend: Bool = false) -> Constant<Unsigned> {
    return Constant(llvm: LLVMConstInt(asLLVM(),
                          value.toUIntMax(),
                          signExtend.llvm))
  }

  /// Creates a signed integer constant value with the given Swift integer value.
  ///
  /// - parameter value: A Swift integer value.
  /// - parameter signExtend: Whether to sign-extend this value to fit this
  ///   type's bit width.  Defaults to `false`.
  public func constant<IntTy: SignedInteger>(_ value: IntTy, signExtend: Bool = false) -> Constant<Signed> {
    return Constant(llvm: LLVMConstInt(asLLVM(),
                                       UInt64(bitPattern: value.toIntMax()),
                                       signExtend.llvm))
  }


  /// Retrieves an integer value of this type's bit width consisting of all
  /// one-bits.
  ///
  /// - returns: A value consisting of all one-bits of this type's bit width.
  public func allOnes() -> IRValue {
    return LLVMConstAllOnes(asLLVM())
  }

  /// Retrieves the underlying LLVM type object.
  public func asLLVM() -> LLVMTypeRef {
    if let context = context {
        return LLVMIntTypeInContext(context.llvm, UInt32(width))
    }
    return LLVMIntType(UInt32(width))
  }
}
