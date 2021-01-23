// SPDX-License-Identifier: MIT
// Copyright (c) 2015-2021 Zig Contributors
// This file is part of [zig](https://ziglang.org/), which is MIT licensed.
// The MIT license requires this copyright notice to be included in all copies
// and substantial portions of the software.
const std = @import("../std.zig");
const CpuFeature = std.Target.Cpu.Feature;
const CpuModel = std.Target.Cpu.Model;

pub const Feature = enum {
    density,
    singlefloat,
    windowed,
    boolean,
    loop,
    sext,
    nsa,
    mul32,
    mul32high,
    div32,
    mac16,
    dfpaccel,
    s32c1i,
    threadptr,
    extendedl32r,
    atomctl,
    //memctl,               // "MEMCTL" is same feature as "ATOMCTL" in Xtensa LLVM. Bug or feature?
    debug,
    exception,
    //highpriinterrupts,    // "HighPriInterrupts" is same feature as "Exception". Bug or feature?
    coprocessor,
    interrupt,
    rvector,
    timerint,
    prid,
    regprotect,
    miscsr,
};

pub usingnamespace CpuFeature.feature_set_fns(Feature);

pub const all_features = blk: {
    const len = @typeInfo(Feature).Enum.fields.len;
    std.debug.assert(len <= CpuFeature.Set.needed_bit_count);
    var result: [len]CpuFeature = undefined;
    result[@enumToInt(Feature.density)] = .{
        .llvm_name = "density",
        .description = "Enable Density instructions",
        .dependencies = featureSet(&[_]Feature{}),
    };
    result[@enumToInt(Feature.singlefloat)] = .{
        .llvm_name = "fp",
        .description = "Enable Xtensa Single FP instructions",
        .dependencies = featureSet(&[_]Feature{}),
    };
    result[@enumToInt(Feature.windowed)] = .{
        .llvm_name = "windowed",
        .description = "Enable Xtensa Windowed Register option",
        .dependencies = featureSet(&[_]Feature{}),
    };
    result[@enumToInt(Feature.boolean)] = .{
        .llvm_name = "bool",
        .description = "Enable Xtensa Boolean extension",
        .dependencies = featureSet(&[_]Feature{}),
    };
    result[@enumToInt(Feature.loop)] = .{
        .llvm_name = "loop",
        .description = "Enable Xtensa Loop extension",
        .dependencies = featureSet(&[_]Feature{}),
    };
    result[@enumToInt(Feature.sext)] = .{
        .llvm_name = "sext",
        .description = "Enable Xtensa Sign Extend option",
        .dependencies = featureSet(&[_]Feature{}),
    };
    result[@enumToInt(Feature.nsa)] = .{
        .llvm_name = "nsa",
        .description = "Enable Xtensa NSA option",
        .dependencies = featureSet(&[_]Feature{}),
    };
    result[@enumToInt(Feature.mul32)] = .{
        .llvm_name = "mul32",
        .description = "Enable Xtensa Mul32 option",
        .dependencies = featureSet(&[_]Feature{}),
    };
    result[@enumToInt(Feature.mul32high)] = .{
        .llvm_name = "mul32high",
        .description = "Enable Xtensa Mul32High option",
        .dependencies = featureSet(&[_]Feature{}),
    };
    result[@enumToInt(Feature.div32)] = .{
        .llvm_name = "div32",
        .description = "Enable Xtensa Div32 option",
        .dependencies = featureSet(&[_]Feature{}),
    };
    result[@enumToInt(Feature.mac16)] = .{
        .llvm_name = "mac16",
        .description = "Enable Xtensa MAC16 instructions",
        .dependencies = featureSet(&[_]Feature{}),
    };
    result[@enumToInt(Feature.dfpaccel)] = .{
        .llvm_name = "dfpaccel",
        .description = "Enable Xtensa Double Precision FP acceleration",
        .dependencies = featureSet(&[_]Feature{}),
    };
    result[@enumToInt(Feature.s32c1i)] = .{
        .llvm_name = "s32c1i",
        .description = "Enable Xtensa S32C1I option",
        .dependencies = featureSet(&[_]Feature{}),
    };
    result[@enumToInt(Feature.threadptr)] = .{
        .llvm_name = "threadptr",
        .description = "Enable Xtensa THREADPTR option",
        .dependencies = featureSet(&[_]Feature{}),
    };
    result[@enumToInt(Feature.extendedl32r)] = .{
        .llvm_name = "extendedl32r",
        .description = "Enable Xtensa Extended L32R option",
        .dependencies = featureSet(&[_]Feature{}),
    };
    result[@enumToInt(Feature.atomctl)] = .{
        .llvm_name = "atomctl",
        .description = "Enable Xtensa ATOMCTL option",
        .dependencies = featureSet(&[_]Feature{}),
    };
//    result[@enumToInt(Feature.memctl)] = .{
//        .llvm_name = "memctl",
//        .description = "Enable Xtensa MEMCTL option",
//        .dependencies = featureSet(&[_]Feature{}),
//    };
    result[@enumToInt(Feature.debug)] = .{
        .llvm_name = "debug",
        .description = "Enable Xtensa Debug option", 
        .dependencies = featureSet(&[_]Feature{}),
    };
    result[@enumToInt(Feature.exception)] = .{
        .llvm_name = "exception",
        .description = "Enable Xtensa Exception option",
        .dependencies = featureSet(&[_]Feature{}),
    };
//    result[@enumToInt(Feature.highpriinterrupts] = .{
//        .llvm_name = "highpriinterrupts",
//        .description = "Enable Xtensa HighPriInterrupts option",
//        .dependencies = featureSet(&[_]Feature{}),
//    };
    result[@enumToInt(Feature.coprocessor)] = .{
        .llvm_name = "coprocessor",
        .description = "Enable Xtensa Coprocessor option",
        .dependencies = featureSet(&[_]Feature{}),
    };
    result[@enumToInt(Feature.interrupt)] = .{
        .llvm_name = "interrupt",
        .description = "Enable Xtensa Interrupt option",
        .dependencies = featureSet(&[_]Feature{}),
    };
    result[@enumToInt(Feature.rvector)] = .{
        .llvm_name = "rvector",
        .description = "Enable Xtensa Relocatable Vector option",
        .dependencies = featureSet(&[_]Feature{}),
    };
    result[@enumToInt(Feature.timerint)] = .{
        .llvm_name = "timerint",
        .description = "Enable Xtensa Timer Interrupt option",
        .dependencies = featureSet(&[_]Feature{}),
    };
    result[@enumToInt(Feature.prid)] = .{
        .llvm_name = "prid",
        .description = "Enable Xtensa Processor ID option",
        .dependencies = featureSet(&[_]Feature{}),
    };
    result[@enumToInt(Feature.regprotect)] = .{
        .llvm_name = "regprotect",
        .description = "Enable Xtensa Region Protection option",
        .dependencies = featureSet(&[_]Feature{}),
    };
    result[@enumToInt(Feature.miscsr)] = .{
        .llvm_name = "miscsr",
        .description = "Enable Xtensa Miscellaneous SR option",
        .dependencies = featureSet(&[_]Feature{}),
    };
    const ti = @typeInfo(Feature);
    for (result) |*elem, i| {
        elem.index = i;
        elem.name = ti.Enum.fields[i].name;
    }
    break :blk result;
};

pub const cpu = struct {
    pub const generic = CpuModel{
        .name = "generic",
        .llvm_name = "generic",
        .features = featureSet(&[_]Feature{}),
    };
    pub const esp32 = CpuModel{
        .name = "esp32",
        .llvm_name = "esp32",
        .features = featureSet(&[_]Feature{
            .density,
            .singlefloat,
            .loop,
            .mac16,
            .windowed,
            .boolean,
            .sext,
            .nsa,
            .mul32,
            .mul32high,
            .dfpaccel,
            .s32c1i,
            .threadptr,
            .div32,
            .atomctl,
            //.memctl,
            .debug,
            .exception,
            //.highpriinterrupts,
            .coprocessor,
            .interrupt,
            .rvector,
            .timerint,
            .prid,
            .regprotect,
            .miscsr,
        }),
    };
    pub const esp8266 = CpuModel{
        .name = "esp8266",
        .llvm_name = "esp8266",
        .features = featureSet(&[_]Feature{
            .density,
            .nsa,
            .mul32,
            .extendedl32r,
            .debug,
            .exception,
            //.highpriinterrupts,
            .interrupt,
            .rvector,
            .timerint,
            .regprotect,
            .prid,
        }),
    };
    pub const esp32_s2 = CpuModel{
        .name = "esp32-s2",
        .llvm_name = "esp32-s2",
        .features = featureSet(&[_]Feature{
            .density,
            .windowed,
            .sext,
            .nsa,
            .mul32,
            .mul32high,
            .threadptr,
            .div32,
            .debug,
            .exception,
            //.highpriinterrupts,
            .coprocessor,
            .interrupt,
            .rvector,
            .timerint,
            .prid,
            .regprotect,
            .miscsr,
        }),
    };
};
