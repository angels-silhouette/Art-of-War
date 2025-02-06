const std = @import("std");
const allocator = std.heap.page_allocator;
const rl = @import("raylib");

pub var sounds: []rl.Sound = undefined;

pub fn LoadSounds() ![]rl.Sound {
    var list = std.ArrayList(rl.Sound).init(allocator);
    defer list.deinit();

    const snap = try rl.loadSound("assets/snap.ogg");
    try list.append(snap);

    const slice = list.items;
    return slice;
}

pub fn drawUI(ui_elements: []UIElement) void {
    // const height = rl.getRenderHeight();
    // const width = rl.getRenderWidth();
    for (ui_elements) |element| {
        std.debug.print("{}", .{element});
    }
}

const Relative = enum {
    top_left,
    top_center,
    top_right,
    middle_left,
    middle_center,
    middle_right,
    bottom_left,
    bottom_center,
    bottom_right,
};

const Position = union(enum) {
    vector: @Vector(2, i32),
    relative: Relative,
};

const UIElement = union(enum) {
    button: Button,
};

const Button = struct {
    coordinates: Position,
    size: @Vector(2, i32),
    text: []const u8,
    sound_effect: rl.Sound,
    pub fn init(coordinates: Position, size: @Vector(2, i32), text: []const u8, sound_effect: rl.Sound) Button {
        return Button{
            .coordinates = coordinates,
            .size = size,
            .text = text,
            .sound_effect = sound_effect,
        };
    }
};

pub var start_ui = [_]UIElement{
    // Button.init(
    //     Position{ .vector = @Vector(2, i32){ 10, 10 } },
    //     @Vector(2, i32){ 100, 100 },
    //     "Start",
    //     sounds[0],
    // ),
};
