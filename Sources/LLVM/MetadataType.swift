#if SWIFT_PACKAGE
import cllvm
#endif

/// The `MetadataType` type represents embedded metadata. No derived types may
/// be created from metadata except for function arguments.
public struct MetadataType: IRType {
  /// Returns the context associated with this type.
  public let context: Context

  /// Creates an embedded metadata type for the given LLVM type object.
  ///
  /// - parameter context: The context to create this type in
  /// - SeeAlso: http://llvm.org/docs/ProgrammersManual.html#achieving-isolation-with-llvmcontext
  public init(in context: Context = Context.global) {
    self.context = context
  }

  /// Retrieves the underlying LLVM type object.
  public func asLLVM() -> LLVMTypeRef {
    fatalError("This version of LLVM does not support the creation of MetadataType objects")
  }
}
