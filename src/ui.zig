const std = @import("std");
const rl = @import("raylib");

pub fn draw_ui(ui_elements: std.ArrayList(ui_element)) !void {
    // const height = rl.getRenderHeight();
    // const width = rl.getRenderWidth();
    for (ui_elements) |element| {
        std.debug.print("{}", .{element});
    }
}

const position = union {
    vector: @Vector(2, i32),
    relative: [32]u8, // describes the position: left, right, top, bottom, center, top-right, top-center, top-right...
};

const ui_element = union {
    button: button,
};

const button = struct {
    coordinates: position,
    size: @Vector(2, i32),
    text: [32]u8,
    sound_effect: rl.Sound,
    pub fn init(coordinates: position, size: @Vector(2, i32), text: [32]u8, sound_effect: rl.Sound) button {
        return button{
            .coordinates = coordinates,
            .size = size,
            .text = text,
            .sound_effect = sound_effect,
        };
    }
};

pub var start_ui = [_]ui_element{
    button.init(
        position{ .vector = @Vector(2, i32){ 10, 10 } },
        @Vector(2, i32){ 100, 100 },
        "Start",
        rl.loadSound("assets/snap.ogg"),
    ),
};
