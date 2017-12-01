#if SWIFT_PACKAGE
import cllvm
#endif

/// `TokenType` is used when a value is associated with an instruction but all
/// uses of the value must not attempt to introspect or obscure it. As such, it
/// is not appropriate to have a `PHI` or `select` of type `TokenType`.
public struct TokenType: IRType {
  /// Returns the context associated with this type.
  public let context: Context

  /// Initializes a token type from the given LLVM type object.
  ///
  /// - parameter context: The context to create this type in
  /// - SeeAlso: http://llvm.org/docs/ProgrammersManual.html#achieving-isolation-with-llvmcontext
  public init(in context: Context = Context.global) {
    self.context = context
  }

  /// Retrieves the underlying LLVM type object.
  public func asLLVM() -> LLVMTypeRef {
    fatalError("This version of LLVM does not support the creation of TokenType objects")
  }
}
