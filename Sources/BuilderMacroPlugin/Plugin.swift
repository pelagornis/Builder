#if canImport(SwiftCompilerPlugin)
import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct BuilderMacroPlugin: CompilerPlugin {
    var providingMacros: [Macro.Type] = [
        BuilderMacro.self
    ]
}
#endif
