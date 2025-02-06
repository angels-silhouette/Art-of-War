const std = @import("std");
const rl = @import("raylib");
const ui = @import("ui.zig");

const State = enum {
    start,
};

var game_state = State.start;

pub fn main() !void {
    rl.initWindow(1000, 800, "The Art of War");
    defer rl.closeWindow();

    rl.initAudioDevice();
    defer rl.closeAudioDevice();

    {
        const sounds = try ui.LoadSounds();
        ui.sounds = sounds;
    }

    rl.setTargetFPS(60);

    rl.toggleFullscreen();

    while (!rl.windowShouldClose()) {
        rl.beginDrawing();
        defer rl.endDrawing();
        switch (game_state) {
            .start => ui.drawUI(&ui.start_ui),
        }
    }
}
