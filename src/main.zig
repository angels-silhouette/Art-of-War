const std = @import("std");
const print = std.debug.print;
const rl = @import("raylib");
const ui = @import("ui.zig");

var current_screen: [32]u8 = "start";

pub fn main() !void {
    rl.initWindow(1000, 800, "The Art of War");
    defer rl.closeWindow();

    rl.initAudioDevice();
    defer rl.closeAudioDevice();

    rl.setTargetFPS(60);

    rl.toggleFullscreen();

    while (!rl.windowShouldClose()) {
        rl.beginDrawing();
        defer rl.endDrawing();

        if (std.mem.eql(u8, current_screen, "start")) {
            ui.draw_ui(ui.start_ui);
        }
    }
}
