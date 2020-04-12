#!/usr/bin/env bash

# lldb-9
update-alternatives \
    --install /usr/bin/lldb lldb /usr/bin/lldb-9 200 \
    --slave /usr/bin/lldb-argdumper lldb-argdumper /usr/bin/lldb-argdumper-9 \
    --slave /usr/bin/lldb-instr lldb-instr /usr/bin/lldb-instr-9 \
    --slave /usr/bin/lldb-mi lldb-mi /usr/bin/lldb-mi-9 \
    --slave /usr/bin/lldb-server lldb-server /usr/bin/lldb-server-9 \
    --slave /usr/bin/lldb-vscode lldb-vscode /usr/bin/lldb-vscode-9

# clang-9
update-alternatives \
    --install /usr/bin/clang clang /usr/bin/clang-9 200 \
    --slave /usr/bin/asan_symbolize asan_symbolize /usr/bin/asan_symbolize-9 \
    --slave /usr/bin/clang++ clang++ /usr/bin/clang++-9 \
    --slave /usr/bin/clang-cpp clang-cpp /usr/bin/clang-cpp-9

update-alternatives --install /usr/bin/cc cc /usr/bin/clang 200
update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++ 200

# llvm-9
update-alternatives \
    --install /usr/bin/llvm-config llvm-config /usr/bin/llvm-config-9 200 \
    --slave /usr/bin/bugpoint bugpoint /usr/bin/bugpoint-9 \
    --slave /usr/bin/lli lli /usr/bin/lli-9 \
    --slave /usr/bin/lli-child-target lli-child-target /usr/bin/lli-child-target-9 \
    --slave /usr/bin/llc llc /usr/bin/llc-9 \
    --slave /usr/bin/llvm-PerfectShuffle llvm-PerfectShuffle /usr/bin/llvm-PerfectShuffle-9 \
    --slave /usr/bin/llvm-addr2line llvm-addr2line /usr/bin/llvm-addr2line-9 \
    --slave /usr/bin/llvm-ar llvm-ar /usr/bin/llvm-ar-9 \
    --slave /usr/bin/llvm-as llvm-as /usr/bin/llvm-as-9 \
    --slave /usr/bin/llvm-bcanalyzer llvm-bcanalyzer /usr/bin/llvm-bcanalyzer-9 \
    --slave /usr/bin/llvm-c-test llvm-c-test /usr/bin/llvm-c-test-9 \
    --slave /usr/bin/llvm-cat llvm-cat /usr/bin/llvm-cat-9 \
    --slave /usr/bin/llvm-cfi-verify llvm-cfi-verify /usr/bin/llvm-cfi-verify-9 \
    --slave /usr/bin/llvm-cov llvm-cov /usr/bin/llvm-cov-9 \
    --slave /usr/bin/llvm-cvtres llvm-cvtres /usr/bin/llvm-cvtres-9 \
    --slave /usr/bin/llvm-cxxdump llvm-cxxdump /usr/bin/llvm-cxxdump-9 \
    --slave /usr/bin/llvm-cxxfilt llvm-cxxfilt /usr/bin/llvm-cxxfilt-9 \
    --slave /usr/bin/llvm-cxxmap llvm-cxxmap /usr/bin/llvm-cxxmap-9 \
    --slave /usr/bin/llvm-diff llvm-diff /usr/bin/llvm-diff-9 \
    --slave /usr/bin/llvm-dis llvm-dis /usr/bin/llvm-dis-9 \
    --slave /usr/bin/llvm-dlltool llvm-dlltool /usr/bin/llvm-dlltool-9 \
    --slave /usr/bin/dsymutil dsymutil /usr/bin/dsymutil-9 \
    --slave /usr/bin/llvm-dwarfdump llvm-dwarfdump /usr/bin/llvm-dwarfdump-9 \
    --slave /usr/bin/llvm-dwp llvm-dwp /usr/bin/llvm-dwp-9 \
    --slave /usr/bin/llvm-elfabi llvm-elfabi /usr/bin/llvm-elfabi-9 \
    --slave /usr/bin/llvm-exegesis llvm-exegesis /usr/bin/llvm-exegesis-9 \
    --slave /usr/bin/llvm-extract llvm-extract /usr/bin/llvm-extract-9 \
    --slave /usr/bin/llvm-jitlink llvm-jitlink /usr/bin/llvm-jitlink-9 \
    --slave /usr/bin/llvm-lib llvm-lib /usr/bin/llvm-lib-9 \
    --slave /usr/bin/llvm-link llvm-link /usr/bin/llvm-link-9 \
    --slave /usr/bin/llvm-lipo llvm-lipo /usr/bin/llvm-lipo-9 \
    --slave /usr/bin/llvm-lto llvm-lto /usr/bin/llvm-lto-9 \
    --slave /usr/bin/llvm-lto2 llvm-lto2 /usr/bin/llvm-lto2-9 \
    --slave /usr/bin/llvm-mc llvm-mc /usr/bin/llvm-mc-9 \
    --slave /usr/bin/llvm-mca llvm-mca /usr/bin/llvm-mca-9 \
    --slave /usr/bin/llvm-modextract llvm-modextract /usr/bin/llvm-modextract-9 \
    --slave /usr/bin/llvm-mt llvm-mt  /usr/bin/llvm-mt-9 \
    --slave /usr/bin/llvm-nm llvm-nm /usr/bin/llvm-nm-9 \
    --slave /usr/bin/llvm-objcopy llvm-objcopy /usr/bin/llvm-objcopy-9 \
    --slave /usr/bin/llvm-objdump llvm-objdump /usr/bin/llvm-objdump-9 \
    --slave /usr/bin/llvm-opt-report llvm-opt-report /usr/bin/llvm-opt-report-9 \
    --slave /usr/bin/llvm-pdbutil llvm-pdbutil /usr/bin/llvm-pdbutil-9 \
    --slave /usr/bin/llvm-profdata llvm-profdata /usr/bin/llvm-profdata-9 \
    --slave /usr/bin/llvm-ranlib llvm-ranlib /usr/bin/llvm-ranlib-9 \
    --slave /usr/bin/llvm-rc llvm-rc /usr/bin/llvm-rc-9 \
    --slave /usr/bin/llvm-readelf llvm-readelf /usr/bin/llvm-readelf-9 \
    --slave /usr/bin/llvm-readobj llvm-readobj /usr/bin/llvm-readobj-9 \
    --slave /usr/bin/llvm-rtdyld llvm-rtdyld /usr/bin/llvm-rtdyld-9 \
    --slave /usr/bin/llvm-size llvm-size /usr/bin/llvm-size-9 \
    --slave /usr/bin/llvm-split llvm-split /usr/bin/llvm-split-9 \
    --slave /usr/bin/llvm-stress llvm-stress /usr/bin/llvm-stress-9 \
    --slave /usr/bin/llvm-strings llvm-strings /usr/bin/llvm-strings-9 \
    --slave /usr/bin/llvm-strip llvm-strip /usr/bin/llvm-strip-9 \
    --slave /usr/bin/llvm-symbolizer llvm-symbolizer /usr/bin/llvm-symbolizer-9 \
    --slave /usr/bin/llvm-tblgen llvm-tblgen /usr/bin/llvm-tblgen-9 \
    --slave /usr/bin/llvm-undname llvm-undname /usr/bin/llvm-undname-9 \
    --slave /usr/bin/llvm-xray llvm-xray /usr/bin/llvm-xray-9 \
    --slave /usr/bin/obj2yaml obj2yaml /usr/bin/obj2yaml-9 \
    --slave /usr/bin/opt opt /usr/bin/opt-9 \
    --slave /usr/bin/sanstats sanstats /usr/bin/sanstats-9 \
    --slave /usr/bin/verify-uselistorder verify-uselistorder /usr/bin/verify-uselistorder-9 \
    --slave /usr/bin/yaml2obj yaml2obj /usr/bin/yaml2obj-9


# llvm-9-tools
update-alternatives --install /usr/bin/FileCheck FileCheck /usr/bin/FileCheck-9 200
update-alternatives --install /usr/bin/count count /usr/bin/count-9 200
update-alternatives --install /usr/bin/not not /usr/bin/not-9 200

# lld-9
update-alternatives --install /usr/bin/lld64 lld64 /usr/bin/ld64.lld-9 200
update-alternatives --install /usr/bin/lld lld /usr/bin/lld-9 200
update-alternatives --install /usr/bin/ld ld /usr/bin/lld 200
# update-alternatives --install /usr/bin/ld ld /usr/bin/ld.lld-9 200
update-alternatives --install /usr/bin/lld-link lld-link /usr/bin/lld-link-9 200
update-alternatives --install /usr/bin/wasm-ld wasm-ld /usr/bin/wasm-ld-9 200

# clang-tools-9
update-alternatives --install /usr/bin/c-index-test c-index-test /usr/bin/c-index-test-9 200
update-alternatives --install /usr/bin/clang-apply-replacements clang-apply-replacements /usr/bin/clang-apply-replacements-9 200
update-alternatives --install /usr/bin/clang-change-namespace clang-change-namespace /usr/bin/clang-change-namespace-9 200
update-alternatives --install /usr/bin/clang-check clang-check /usr/bin/clang-check-9 200
update-alternatives --install /usr/bin/clang-cl clang-cl /usr/bin/clang-cl-9 200
update-alternatives --install /usr/bin/clang-doc clang-doc /usr/bin/clang-doc-9 200
update-alternatives --install /usr/bin/clang-extdef-mapping clang-extdef-mapping /usr/bin/clang-extdef-mapping-9 200
update-alternatives --install /usr/bin/clang-import-test clang-import-test /usr/bin/clang-import-test-9 200
update-alternatives --install /usr/bin/clang-include-fixer clang-include-fixer /usr/bin/clang-include-fixer-9 200
update-alternatives --install /usr/bin/clang-offload-bundler clang-offload-bundler /usr/bin/clang-offload-bundler-9 200
update-alternatives --install /usr/bin/clang-query clang-query /usr/bin/clang-query-9 200
update-alternatives --install /usr/bin/clang-refactor clang-refactor /usr/bin/clang-refactor-9 200
update-alternatives --install /usr/bin/clang-rename clang-rename /usr/bin/clang-rename-9 200
update-alternatives --install /usr/bin/clang-reorder-fields clang-reorder-fields /usr/bin/clang-reorder-fields-9 200
update-alternatives --install /usr/bin/clang-scan-deps clang-scan-deps /usr/bin/clang-scan-deps-9 200
update-alternatives --install /usr/bin/diagtool diagtool /usr/bin/diagtool-9 200
update-alternatives --install /usr/bin/find-all-symbols find-all-symbols /usr/bin/find-all-symbols-9 200
update-alternatives --install /usr/bin/hmaptool hmaptool /usr/bin/hmaptool-9 200
update-alternatives --install /usr/bin/modularize modularize /usr/bin/modularize-9 200
update-alternatives --install /usr/bin/sancov sancov /usr/bin/sancov-9 200
update-alternatives --install /usr/bin/scan-build scan-build /usr/bin/scan-build-9 200
update-alternatives --install /usr/bin/scan-build-py scan-build-py /usr/bin/scan-build-py-9 200
update-alternatives --install /usr/bin/scan-view scan-view /usr/bin/scan-view-9 200

# clang-format-9
update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-9 200
update-alternatives --install /usr/bin/clang-format-diff clang-format-diff /usr/bin/clang-format-diff-9 200
update-alternatives --install /usr/bin/git-clang-format git-clang-format /usr/bin/git-clang-format-9 200

# clang-tidy-9
update-alternatives --install /usr/bin/clang-tidy clang-tidy /usr/bin/clang-tidy-9 200
update-alternatives --install /usr/bin/clang-tidy-diff.py clang-tidy-diff.py /usr/bin/clang-tidy-diff-9.py 200
update-alternatives --install /usr/bin/run-clang-tidy run-clang-tidy /usr/bin/run-clang-tidy-9 200
update-alternatives --install /usr/bin/run-clang-tidy.py run-clang-tidy.py /usr/bin/run-clang-tidy-9.py 200

# clangd-9
update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-9 200
