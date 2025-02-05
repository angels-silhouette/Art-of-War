const std = @import("std");
const rl = @import("raylib");

pub fn drawUI(ui_elements: std.ArrayList(UIElement)) !void {
    // const height = rl.getRenderHeight();
    // const width = rl.getRenderWidth();
    for (ui_elements) |element| {
        std.debug.print("{}", .{element});
    }
}

const Position = union {
    vector: @Vector(2, i32),
    relative: [32]u8, // describes the position: left, right, top, bottom, center, top-right, top-center, top-right...
};

const UIElement = union {
    button: Button,
};

const Button = struct {
    coordinates: Position,
    size: @Vector(2, i32),
    text: [32]u8,
    sound_effect: rl.Sound,
    pub fn init(coordinates: Position, size: @Vector(2, i32), text: [32]u8, sound_effect: rl.Sound) Button {
        return Button{
            .coordinates = coordinates,
            .size = size,
            .text = text,
            .sound_effect = sound_effect,
        };
    }
};

pub var start_ui = [_]UIElement{
    Button.init(
        Position{ .vector = @Vector(2, i32){ 10, 10 } },
        @Vector(2, i32){ 100, 100 },
        "Start",
        rl.loadSound("assets/snap.ogg"),
    ),
};
