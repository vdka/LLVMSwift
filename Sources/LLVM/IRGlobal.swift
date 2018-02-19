#if SWIFT_PACKAGE
import cllvm
#endif

/// An `IRGlobal` is a value, alias, or function that exists at the top level of
/// an LLVM module.
public protocol IRGlobal: IRValue {}

extension IRGlobal {
  /// Retrieves the alignment of this value.
  public var alignment: Int {
    get { return Int(LLVMGetAlignment(asLLVM())) }
    set { LLVMSetAlignment(asLLVM(), UInt32(newValue)) }
  }
  
  /// Retrieves the linkage information for this global.
  public var linkage: Linkage {
    get { return Linkage(llvm: LLVMGetLinkage(asLLVM())) }
    set { LLVMSetLinkage(asLLVM(), newValue.llvm) }
  }

  /// Retrieves the visibility style for this global.
  public var visibility: Visibility {
    get { return Visibility(llvm: LLVMGetVisibility(asLLVM())) }
    set { LLVMSetVisibility(asLLVM(), newValue.llvm) }
  }

  /// Retrieves the storage class for this global declaration.  For use with
  /// Portable Executable files.
  public var storageClass: StorageClass {
    get { return StorageClass(llvm: LLVMGetDLLStorageClass(asLLVM())) }
    set { LLVMSetDLLStorageClass(asLLVM(), newValue.llvm) }
  }

  /// Retrieves an indicator for the significance of a global value's address.
  public var unnamedAddressKind: UnnamedAddressKind {
    get { return UnnamedAddressKind(llvm: LLVMHasUnnamedAddr(asLLVM()))  }
    set { LLVMSetUnnamedAddr(asLLVM(), newValue.llvm) }
  }

  /// Retrieves the section associated with the symbol that will eventually be
  /// emitted for this global value.
  ///
  /// - Note: Global `Alias` values may or may not be resolvable to any
  ///   particular section given the state of the IR in an arbitrary module. A
  ///   return value of the empty string indicates a failed section lookup.
  public var section: String {
    get {
      guard let sname = LLVMGetSection(asLLVM()) else { return "" }
      return String(cString: sname)
    }
    set { LLVMSetSection(asLLVM(), newValue) }
  }
}
