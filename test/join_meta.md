```sh
 $ 	../src/join_meta -rewrite pa_ppx_perl_runtime:pa_ppx_perl.runtime -direct-include t/join_meta/pa_perl -wrap-subdir runtime:t/join_meta/runtime
 
   # Specifications for the "pa_ppx_perl" preprocessor:
   requires = "camlp5,fmt,re,pa_ppx.base,pa_ppx_perl.runtime,camlp5.parser_quotations"
   version = "0.01"
   description = "pa_ppx_perl: pa_ppx_perl rewriter"
 
   # For linking
   package "link" (
   requires = "camlp5,fmt,re,pa_ppx.base.link,camlp5.parser_quotations.link"
   archive(byte) = "pa_ppx_perl.cma"
   archive(native) = "pa_ppx_perl.cmxa"
   )
 
   # For the toploop:
   archive(byte,toploop) = "pa_ppx_perl.cma"
 
     # For the preprocessor itself:
     requires(syntax,preprocessor) = "camlp5,fmt,re,pa_ppx.base,camlp5.parser_quotations"
     archive(syntax,preprocessor,-native) = "pa_ppx_perl.cma"
     archive(syntax,preprocessor,native) = "pa_ppx_perl.cmxa"
 
 
 package "runtime" (
 
   # Specifications for the "pa_ppx_perl_runtime" package:
   requires = "fmt"
   version = "0.01"
   description = "pa_ppx_perl runtime support"
 
   # For linking
   archive(byte) = "pa_ppx_perl_runtime.cma"
   archive(native) = "pa_ppx_perl_runtime.cmxa"
 
   # For the toploop:
   archive(byte,toploop) = "pa_ppx_perl_runtime.cma"
 
 
 )
 ```
