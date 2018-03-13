# Download and install Google v8

cmake_minimum_required(VERSION 3.1.0)

add_definitions(-DARCH_${ARCH})
add_definitions(-DARCH="${ARCH}")

set(V8_SRC ${INCLUDEOS_ROOT}/lib/v8/src)

include_directories(${V8_SRC}/../../trace_event)
include_directories(${V8_SRC}/../include)
include_directories(${V8_SRC})
include_directories(${V8_SRC}/..)
include_directories(${INCLUDEOS_ROOT}/api/posix)
include_directories(${INCLUDEOS_ROOT}/api/kernel)
include_directories(${MUSL_INCLUDE_DIR})
include_directories(${LIBCXX_INCLUDE_DIR})

set(V8_SOURCES
    ${V8_SRC}/accessors.cc
    ${V8_SRC}/address-map.cc
    ${V8_SRC}/allocation.cc
    ${V8_SRC}/allocation-site-scopes.cc
    ${V8_SRC}/api-experimental.cc
    ${V8_SRC}/api.cc
    ${V8_SRC}/api-arguments.cc
    ${V8_SRC}/api-natives.cc
    ${V8_SRC}/arguments.cc
    ${V8_SRC}/asmjs/asm-js.cc
    ${V8_SRC}/asmjs/asm-types.cc
    ${V8_SRC}/asmjs/asm-wasm-builder.cc
    ${V8_SRC}/asmjs/typing-asm.cc
    ${V8_SRC}/assembler.cc
    ${V8_SRC}/assert-scope.cc
    ${V8_SRC}/ast/ast-expression-rewriter.cc
    ${V8_SRC}/ast/ast-expression-visitor.cc
    ${V8_SRC}/ast/ast-literal-reindexer.cc
    ${V8_SRC}/ast/ast-numbering.cc
    ${V8_SRC}/ast/ast-value-factory.cc
    ${V8_SRC}/ast/ast.cc
    ${V8_SRC}/ast/modules.cc
    ${V8_SRC}/ast/prettyprinter.cc
    ${V8_SRC}/ast/scopeinfo.cc
    ${V8_SRC}/ast/scopes.cc
    ${V8_SRC}/ast/variables.cc
    ${V8_SRC}/background-parsing-task.cc
    ${V8_SRC}/bailout-reason.cc
    ${V8_SRC}/basic-block-profiler.cc
    ${V8_SRC}/bignum-dtoa.cc
    ${V8_SRC}/bignum.cc
    ${V8_SRC}/bit-vector.cc
    ${V8_SRC}/bootstrapper.cc
    ${V8_SRC}/builtins.cc
    ${V8_SRC}/cached-powers.cc
    ${V8_SRC}/cancelable-task.cc
    ${V8_SRC}/char-predicates.cc
    ${V8_SRC}/code-factory.cc
    ${V8_SRC}/code-stub-assembler.cc
    ${V8_SRC}/code-stubs.cc
    ${V8_SRC}/code-stubs-hydrogen.cc
    ${V8_SRC}/codegen.cc
    ${V8_SRC}/compilation-cache.cc
    ${V8_SRC}/compilation-dependencies.cc
    ${V8_SRC}/compilation-statistics.cc
    ${V8_SRC}/compiler/access-builder.cc
    ${V8_SRC}/compiler/access-info.cc
    ${V8_SRC}/compiler/all-nodes.cc
    ${V8_SRC}/compiler/ast-graph-builder.cc
    ${V8_SRC}/compiler/ast-loop-assignment-analyzer.cc
    ${V8_SRC}/compiler/basic-block-instrumentor.cc
    ${V8_SRC}/compiler/branch-elimination.cc
    ${V8_SRC}/compiler/bytecode-branch-analysis.cc
    ${V8_SRC}/compiler/bytecode-graph-builder.cc
    ${V8_SRC}/compiler/c-linkage.cc
    ${V8_SRC}/compiler/checkpoint-elimination.cc
    ${V8_SRC}/compiler/code-generator.cc
    ${V8_SRC}/compiler/code-assembler.cc
    ${V8_SRC}/compiler/common-node-cache.cc
    ${V8_SRC}/compiler/common-operator-reducer.cc
    ${V8_SRC}/compiler/common-operator.cc
    ${V8_SRC}/compiler/control-builders.cc
    ${V8_SRC}/compiler/control-equivalence.cc
    ${V8_SRC}/compiler/control-flow-optimizer.cc
    ${V8_SRC}/compiler/dead-code-elimination.cc
    ${V8_SRC}/compiler/effect-control-linearizer.cc
    ${V8_SRC}/compiler/escape-analysis.cc
    ${V8_SRC}/compiler/escape-analysis-reducer.cc
    ${V8_SRC}/compiler/frame.cc
    ${V8_SRC}/compiler/frame-elider.cc
    ${V8_SRC}/compiler/frame-states.cc
    ${V8_SRC}/compiler/gap-resolver.cc
    ${V8_SRC}/compiler/graph-reducer.cc
    ${V8_SRC}/compiler/graph-replay.cc
    ${V8_SRC}/compiler/graph-trimmer.cc
    ${V8_SRC}/compiler/graph-visualizer.cc
    ${V8_SRC}/compiler/graph.cc
    ${V8_SRC}/compiler/instruction-selector.cc
    ${V8_SRC}/compiler/instruction-scheduler.cc
    ${V8_SRC}/compiler/instruction.cc
    ${V8_SRC}/compiler/int64-lowering.cc
    ${V8_SRC}/compiler/js-builtin-reducer.cc
    ${V8_SRC}/compiler/js-call-reducer.cc
    ${V8_SRC}/compiler/js-context-specialization.cc
    ${V8_SRC}/compiler/js-create-lowering.cc
    ${V8_SRC}/compiler/js-frame-specialization.cc
    ${V8_SRC}/compiler/js-generic-lowering.cc
    ${V8_SRC}/compiler/js-global-object-specialization.cc
    ${V8_SRC}/compiler/js-graph.cc
    ${V8_SRC}/compiler/js-inlining.cc
    ${V8_SRC}/compiler/js-inlining-heuristic.cc
    ${V8_SRC}/compiler/js-intrinsic-lowering.cc
    ${V8_SRC}/compiler/js-native-context-specialization.cc
    ${V8_SRC}/compiler/js-operator.cc
    ${V8_SRC}/compiler/js-typed-lowering.cc
    ${V8_SRC}/compiler/jump-threading.cc
    ${V8_SRC}/compiler/linkage.cc
    ${V8_SRC}/compiler/liveness-analyzer.cc
    ${V8_SRC}/compiler/live-range-separator.cc
    ${V8_SRC}/compiler/load-elimination.cc
    ${V8_SRC}/compiler/loop-analysis.cc
    ${V8_SRC}/compiler/loop-peeling.cc
    ${V8_SRC}/compiler/machine-operator-reducer.cc
    ${V8_SRC}/compiler/machine-operator.cc
    ${V8_SRC}/compiler/memory-optimizer.cc
    ${V8_SRC}/compiler/move-optimizer.cc
    ${V8_SRC}/compiler/node-cache.cc
    ${V8_SRC}/compiler/node-marker.cc
    ${V8_SRC}/compiler/node-matchers.cc
    ${V8_SRC}/compiler/node-properties.cc
    ${V8_SRC}/compiler/node.cc
    ${V8_SRC}/compiler/opcodes.cc
    ${V8_SRC}/compiler/operation-typer.cc
    ${V8_SRC}/compiler/operator-properties.cc
    ${V8_SRC}/compiler/operator.cc
    ${V8_SRC}/compiler/osr.cc
    ${V8_SRC}/compiler/pipeline.cc
    ${V8_SRC}/compiler/pipeline-statistics.cc
    ${V8_SRC}/compiler/raw-machine-assembler.cc
    ${V8_SRC}/compiler/redundancy-elimination.cc
    ${V8_SRC}/compiler/register-allocator.cc
    ${V8_SRC}/compiler/register-allocator-verifier.cc
    ${V8_SRC}/compiler/representation-change.cc
    ${V8_SRC}/compiler/schedule.cc
    ${V8_SRC}/compiler/scheduler.cc
    ${V8_SRC}/compiler/select-lowering.cc
    ${V8_SRC}/compiler/simplified-lowering.cc
    ${V8_SRC}/compiler/simplified-operator-reducer.cc
    ${V8_SRC}/compiler/simplified-operator.cc
    ${V8_SRC}/compiler/source-position.cc
    ${V8_SRC}/compiler/state-values-utils.cc
    ${V8_SRC}/compiler/store-store-elimination.cc
    ${V8_SRC}/compiler/tail-call-optimization.cc
    ${V8_SRC}/compiler/type-hint-analyzer.cc
    ${V8_SRC}/compiler/type-hints.cc
    ${V8_SRC}/compiler/typer.cc
    ${V8_SRC}/compiler/value-numbering-reducer.cc
    ${V8_SRC}/compiler/verifier.cc
    ${V8_SRC}/compiler/wasm-compiler.cc
    ${V8_SRC}/compiler/wasm-linkage.cc
    ${V8_SRC}/compiler/zone-pool.cc
    ${V8_SRC}/compiler.cc
    ${V8_SRC}/context-measure.cc
    ${V8_SRC}/contexts.cc
    ${V8_SRC}/conversions.cc
    ${V8_SRC}/counters.cc
    ${V8_SRC}/crankshaft/compilation-phase.cc
    ${V8_SRC}/crankshaft/hydrogen-bce.cc
    ${V8_SRC}/crankshaft/hydrogen-canonicalize.cc
    ${V8_SRC}/crankshaft/hydrogen-check-elimination.cc
    ${V8_SRC}/crankshaft/hydrogen-dce.cc
    ${V8_SRC}/crankshaft/hydrogen-dehoist.cc
    ${V8_SRC}/crankshaft/hydrogen-environment-liveness.cc
    ${V8_SRC}/crankshaft/hydrogen-escape-analysis.cc
    ${V8_SRC}/crankshaft/hydrogen-gvn.cc
    ${V8_SRC}/crankshaft/hydrogen-infer-representation.cc
    ${V8_SRC}/crankshaft/hydrogen-infer-types.cc
    ${V8_SRC}/crankshaft/hydrogen-instructions.cc
    ${V8_SRC}/crankshaft/hydrogen-load-elimination.cc
    ${V8_SRC}/crankshaft/hydrogen-mark-deoptimize.cc
    ${V8_SRC}/crankshaft/hydrogen-mark-unreachable.cc
    ${V8_SRC}/crankshaft/hydrogen-osr.cc
    ${V8_SRC}/crankshaft/hydrogen-range-analysis.cc
    ${V8_SRC}/crankshaft/hydrogen-redundant-phi.cc
    ${V8_SRC}/crankshaft/hydrogen-removable-simulates.cc
    ${V8_SRC}/crankshaft/hydrogen-representation-changes.cc
    ${V8_SRC}/crankshaft/hydrogen-sce.cc
    ${V8_SRC}/crankshaft/hydrogen-store-elimination.cc
    ${V8_SRC}/crankshaft/hydrogen-types.cc
    ${V8_SRC}/crankshaft/hydrogen-uint32-analysis.cc
    ${V8_SRC}/crankshaft/hydrogen.cc
    ${V8_SRC}/crankshaft/lithium-allocator.cc
    ${V8_SRC}/crankshaft/lithium-codegen.cc
    ${V8_SRC}/crankshaft/lithium.cc
    ${V8_SRC}/crankshaft/typing.cc
    ${V8_SRC}/date.cc
    ${V8_SRC}/dateparser.cc
    ${V8_SRC}/debug/debug-evaluate.cc
    ${V8_SRC}/debug/debug-frames.cc
    ${V8_SRC}/debug/debug-scopes.cc
    ${V8_SRC}/debug/debug.cc
    ${V8_SRC}/debug/liveedit.cc
    ${V8_SRC}/deoptimizer.cc
    ${V8_SRC}/disassembler.cc
    ${V8_SRC}/diy-fp.cc
    ${V8_SRC}/dtoa.cc
    ${V8_SRC}/eh-frame.cc
    ${V8_SRC}/elements-kind.cc
    ${V8_SRC}/elements.cc
    ${V8_SRC}/execution.cc
    ${V8_SRC}/extensions/externalize-string-extension.cc
    ${V8_SRC}/extensions/free-buffer-extension.cc
    ${V8_SRC}/extensions/gc-extension.cc
    ${V8_SRC}/extensions/ignition-statistics-extension.cc
    ${V8_SRC}/extensions/statistics-extension.cc
    ${V8_SRC}/extensions/trigger-failure-extension.cc
    ${V8_SRC}/external-reference-table.cc
    ${V8_SRC}/factory.cc
    ${V8_SRC}/fast-accessor-assembler.cc
    ${V8_SRC}/fast-dtoa.cc
    ${V8_SRC}/field-type.cc
    ${V8_SRC}/fixed-dtoa.cc
    ${V8_SRC}/flags.cc
    ${V8_SRC}/frames.cc
    ${V8_SRC}/full-codegen/full-codegen.cc
    ${V8_SRC}/futex-emulation.cc
    ${V8_SRC}/gdb-jit.cc
    ${V8_SRC}/global-handles.cc
    ${V8_SRC}/handles.cc
    ${V8_SRC}/heap/array-buffer-tracker.cc
    ${V8_SRC}/heap/code-stats.cc
    ${V8_SRC}/heap/memory-reducer.cc
    ${V8_SRC}/heap/gc-idle-time-handler.cc
    ${V8_SRC}/heap/gc-tracer.cc
    ${V8_SRC}/heap/heap.cc
    ${V8_SRC}/heap/incremental-marking-job.cc
    ${V8_SRC}/heap/incremental-marking.cc
    ${V8_SRC}/heap/mark-compact.cc
    ${V8_SRC}/heap/object-stats.cc
    ${V8_SRC}/heap/objects-visiting.cc
    ${V8_SRC}/heap/remembered-set.cc
    ${V8_SRC}/heap/scavenge-job.cc
    ${V8_SRC}/heap/scavenger.cc
    ${V8_SRC}/heap/spaces.cc
    ${V8_SRC}/heap/store-buffer.cc
    ${V8_SRC}/icu_util.cc
    ${V8_SRC}/ic/access-compiler.cc
    ${V8_SRC}/ic/call-optimization.cc
    ${V8_SRC}/ic/handler-compiler.cc
    ${V8_SRC}/ic/ic-state.cc
    ${V8_SRC}/ic/ic.cc
    ${V8_SRC}/ic/ic-compiler.cc
    ${V8_SRC}/identity-map.cc
    ${V8_SRC}/interface-descriptors.cc
    ${V8_SRC}/interpreter/bytecodes.cc
    ${V8_SRC}/interpreter/bytecode-array-builder.cc
    ${V8_SRC}/interpreter/bytecode-array-iterator.cc
    ${V8_SRC}/interpreter/bytecode-array-writer.cc
    ${V8_SRC}/interpreter/bytecode-dead-code-optimizer.cc
    ${V8_SRC}/interpreter/bytecode-generator.cc
    ${V8_SRC}/interpreter/bytecode-peephole-optimizer.cc
    ${V8_SRC}/interpreter/bytecode-pipeline.cc
    ${V8_SRC}/interpreter/bytecode-register-allocator.cc
    ${V8_SRC}/interpreter/bytecode-register-optimizer.cc
    ${V8_SRC}/interpreter/constant-array-builder.cc
    ${V8_SRC}/interpreter/control-flow-builders.cc
    ${V8_SRC}/interpreter/handler-table-builder.cc
    ${V8_SRC}/interpreter/interpreter.cc
    ${V8_SRC}/interpreter/interpreter-assembler.cc
    ${V8_SRC}/interpreter/interpreter-intrinsics.cc
    ${V8_SRC}/isolate.cc
    ${V8_SRC}/json-parser.cc
    ${V8_SRC}/json-stringifier.cc
    ${V8_SRC}/keys.cc
    ${V8_SRC}/layout-descriptor.cc
    ${V8_SRC}/log-utils.cc
    ${V8_SRC}/log.cc
    ${V8_SRC}/lookup.cc
    ${V8_SRC}/machine-type.cc
    ${V8_SRC}/messages.cc
    ${V8_SRC}/objects-debug.cc
    ${V8_SRC}/objects-printer.cc
    ${V8_SRC}/objects.cc
    ${V8_SRC}/optimizing-compile-dispatcher.cc
    ${V8_SRC}/ostreams.cc
    ${V8_SRC}/parsing/func-name-inferrer.cc
    ${V8_SRC}/parsing/parameter-initializer-rewriter.cc
    ${V8_SRC}/parsing/parser.cc
    ${V8_SRC}/parsing/pattern-rewriter.cc
    ${V8_SRC}/parsing/preparse-data.cc
    ${V8_SRC}/parsing/preparser.cc
    ${V8_SRC}/parsing/rewriter.cc
    ${V8_SRC}/parsing/scanner-character-streams.cc
    ${V8_SRC}/parsing/scanner.cc
    ${V8_SRC}/parsing/token.cc
    ${V8_SRC}/pending-compilation-error-handler.cc
    ${V8_SRC}/perf-jit.cc
    ${V8_SRC}/profiler/allocation-tracker.cc
    ${V8_SRC}/profiler/cpu-profiler.cc
    ${V8_SRC}/profiler/heap-profiler.cc
    ${V8_SRC}/profiler/heap-snapshot-generator.cc
    ${V8_SRC}/profiler/profiler-listener.cc
    ${V8_SRC}/profiler/profile-generator.cc
    ${V8_SRC}/profiler/sampling-heap-profiler.cc
    ${V8_SRC}/profiler/strings-storage.cc
    ${V8_SRC}/profiler/tick-sample.cc
    ${V8_SRC}/property-descriptor.cc
    ${V8_SRC}/property.cc
    ${V8_SRC}/regexp/interpreter-irregexp.cc
    ${V8_SRC}/regexp/jsregexp.cc
    ${V8_SRC}/regexp/regexp-ast.cc
    ${V8_SRC}/regexp/regexp-macro-assembler-irregexp.cc
    ${V8_SRC}/regexp/regexp-macro-assembler-tracer.cc
    ${V8_SRC}/regexp/regexp-macro-assembler.cc
    ${V8_SRC}/regexp/regexp-parser.cc
    ${V8_SRC}/regexp/regexp-stack.cc
    ${V8_SRC}/register-configuration.cc
    ${V8_SRC}/runtime-profiler.cc
    ${V8_SRC}/runtime/runtime-array.cc
    ${V8_SRC}/runtime/runtime-atomics.cc
    ${V8_SRC}/runtime/runtime-classes.cc
    ${V8_SRC}/runtime/runtime-collections.cc
    ${V8_SRC}/runtime/runtime-compiler.cc
    ${V8_SRC}/runtime/runtime-date.cc
    ${V8_SRC}/runtime/runtime-debug.cc
    ${V8_SRC}/runtime/runtime-forin.cc
    ${V8_SRC}/runtime/runtime-function.cc
    ${V8_SRC}/runtime/runtime-futex.cc
    ${V8_SRC}/runtime/runtime-generator.cc
    ${V8_SRC}/runtime/runtime-i18n.cc
    ${V8_SRC}/runtime/runtime-internal.cc
    ${V8_SRC}/runtime/runtime-interpreter.cc
    ${V8_SRC}/runtime/runtime-literals.cc
    ${V8_SRC}/runtime/runtime-liveedit.cc
    ${V8_SRC}/runtime/runtime-maths.cc
    ${V8_SRC}/runtime/runtime-numbers.cc
    ${V8_SRC}/runtime/runtime-object.cc
    ${V8_SRC}/runtime/runtime-operators.cc
    ${V8_SRC}/runtime/runtime-proxy.cc
    ${V8_SRC}/runtime/runtime-regexp.cc
    ${V8_SRC}/runtime/runtime-scopes.cc
    ${V8_SRC}/runtime/runtime-simd.cc
    ${V8_SRC}/runtime/runtime-strings.cc
    ${V8_SRC}/runtime/runtime-symbol.cc
    ${V8_SRC}/runtime/runtime-test.cc
    ${V8_SRC}/runtime/runtime-typedarray.cc
    ${V8_SRC}/runtime/runtime-wasm.cc
    ${V8_SRC}/runtime/runtime.cc
    ${V8_SRC}/safepoint-table.cc
    ${V8_SRC}/snapshot/mksnapshot.cc
    ${V8_SRC}/snapshot/code-serializer.cc
    ${V8_SRC}/snapshot/deserializer.cc
    ${V8_SRC}/snapshot/natives-common.cc
    ${V8_SRC}/snapshot/partial-serializer.cc
    ${V8_SRC}/snapshot/serializer.cc
    ${V8_SRC}/snapshot/serializer-common.cc
    ${V8_SRC}/snapshot/snapshot-common.cc
    ${V8_SRC}/snapshot/snapshot-source-sink.cc
    ${V8_SRC}/snapshot/startup-serializer.cc
    ${V8_SRC}/source-position-table.cc
    ${V8_SRC}/startup-data-util.cc
    ${V8_SRC}/string-builder.cc
    ${V8_SRC}/string-stream.cc
    ${V8_SRC}/strtod.cc
    ${V8_SRC}/ic/stub-cache.cc
    ${V8_SRC}/tracing/trace-event.cc
    ${V8_SRC}/transitions.cc
    ${V8_SRC}/type-cache.cc
    ${V8_SRC}/type-feedback-vector.cc
    ${V8_SRC}/type-info.cc
    ${V8_SRC}/types.cc
    ${V8_SRC}/unicode.cc
    ${V8_SRC}/unicode-decoder.cc
    ${V8_SRC}/uri.cc
    ${V8_SRC}/utils.cc
    ${V8_SRC}/v8.cc
    ${V8_SRC}/v8threads.cc
    ${V8_SRC}/version.cc
    ${V8_SRC}/wasm/ast-decoder.cc
    ${V8_SRC}/wasm/encoder.cc
    ${V8_SRC}/wasm/module-decoder.cc
    ${V8_SRC}/wasm/switch-logic.cc
    ${V8_SRC}/wasm/wasm-debug.cc
    ${V8_SRC}/wasm/wasm-external-refs.cc
    ${V8_SRC}/wasm/wasm-function-name-table.cc
    ${V8_SRC}/wasm/wasm-js.cc
    ${V8_SRC}/wasm/wasm-module.cc
    ${V8_SRC}/wasm/wasm-interpreter.cc
    ${V8_SRC}/wasm/wasm-opcodes.cc
    ${V8_SRC}/wasm/wasm-result.cc
    ${V8_SRC}/zone.cc
    ${V8_SRC}/crankshaft/x64/lithium-codegen-x64.cc
    ${V8_SRC}/crankshaft/x64/lithium-gap-resolver-x64.cc
    ${V8_SRC}/crankshaft/x64/lithium-x64.cc
    ${V8_SRC}/x64/assembler-x64.cc
    ${V8_SRC}/x64/builtins-x64.cc
    ${V8_SRC}/x64/code-stubs-x64.cc
    ${V8_SRC}/x64/codegen-x64.cc
    ${V8_SRC}/x64/cpu-x64.cc
    ${V8_SRC}/x64/deoptimizer-x64.cc
    ${V8_SRC}/x64/disasm-x64.cc
    ${V8_SRC}/x64/frames-x64.cc
    ${V8_SRC}/x64/interface-descriptors-x64.cc
    ${V8_SRC}/x64/macro-assembler-x64.cc
    ${V8_SRC}/debug/x64/debug-x64.cc
    ${V8_SRC}/full-codegen/x64/full-codegen-x64.cc
    ${V8_SRC}/ic/x64/access-compiler-x64.cc
    ${V8_SRC}/ic/x64/handler-compiler-x64.cc
    ${V8_SRC}/ic/x64/ic-x64.cc
    ${V8_SRC}/ic/x64/ic-compiler-x64.cc
    ${V8_SRC}/ic/x64/stub-cache-x64.cc
    ${V8_SRC}/regexp/x64/regexp-macro-assembler-x64.cc
    ${V8_SRC}/compiler/x64/code-generator-x64.cc
    ${V8_SRC}/compiler/x64/instruction-scheduler-x64.cc
    ${V8_SRC}/compiler/x64/instruction-selector-x64.cc

    ${V8_SRC}/base/accounting-allocator.cc
    ${V8_SRC}/base/atomicops_internals_x86_gcc.cc
    ${V8_SRC}/base/bits.cc
    ${V8_SRC}/base/cpu.cc
    ${V8_SRC}/base/division-by-constant.cc
    ${V8_SRC}/base/file-utils.cc
    ${V8_SRC}/base/functional.cc
    ${V8_SRC}/base/ieee754.cc
    ${V8_SRC}/base/logging.cc
    ${V8_SRC}/base/once.cc
    ${V8_SRC}/base/platform/time.cc
    ${V8_SRC}/base/platform/condition-variable.cc
    ${V8_SRC}/base/platform/mutex.cc
    ${V8_SRC}/base/platform/semaphore.cc
    ${V8_SRC}/base/sys-info.cc
    ${V8_SRC}/base/utils/random-number-generator.cc
    #${V8_SRC}/base/platform/platform-runtimejs.cc
    ${V8_SRC}/gen/experimental-extras-libraries.cc
    ${V8_SRC}/gen/experimental-libraries.cc
    ${V8_SRC}/gen/extras-libraries.cc
    ${V8_SRC}/gen/libraries.cc
    ${V8_SRC}/gen/resources.cc
    #${V8_SRC}/snapshot/snapshot-empty.cc
    #TODO: Find out what this is
    #../gen/snapshot.cc
)

add_library(v8 STATIC ${V8_SOURCES})
target_compile_definitions(v8 PRIVATE HAVE_PTHREAD=0)

# Make sure precompiled libraries exists
add_dependencies(v8 libcxx)

# Install library
install(TARGETS v8 DESTINATION includeos/${ARCH}/lib)

# Install headers
install(DIRECTORY ${V8_SRC}/include
  DESTINATION includeos/include
  FILES_MATCHING PATTERN "*.h")
