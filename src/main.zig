const std = @import("std");
const print = std.debug.print;
const raylib = @import("raylib");

pub fn main() anyerror!void {
    const screen_width = 800;
    const screen_height = 400;

    raylib.initWindow(screen_width, screen_height, "raylib basic window");
    defer raylib.closeWindow();

    raylib.setTargetFPS(60);

    while (!raylib.windowShouldClose()) {
        raylib.beginDrawing();
        defer raylib.endDrawing();

        raylib.clearBackground(raylib.Color.white);

        raylib.drawText("UwU", 190, 200, 20, raylib.Color.black);
    }
}
