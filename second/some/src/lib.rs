use cairo_lang_macro::{attribute_macro, ProcMacroResult, TokenStream};

#[attribute_macro]
fn test(token_stream: TokenStream) -> ProcMacroResult {
    ProcMacroResult::new(token_stream)
}
