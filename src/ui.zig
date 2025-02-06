const std = @import("std");
const allocator = std.heap.page_allocator;
const rl = @import("raylib");

var sounds: []rl.Sound = undefined;
pub var start_ui: []UIElement = undefined;

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
};

fn loadSounds() !void {
    var list = std.ArrayList(rl.Sound).init(allocator);

    const snap = try rl.loadSound("assets/snap.ogg");
    try list.append(snap);

    sounds = list.items;
}

pub fn initUI() !void {
    try loadSounds();

    {
        var list = std.ArrayList(UIElement).init(allocator);

        const button = UIElement{ .button = Button{
            .coordinates = Position{ .vector = @Vector(2, i32){ 10, 10 } },
            .size = @Vector(2, i32){ 100, 100 },
            .text = "Start",
            .sound_effect = sounds[0],
        } };
        try list.append(button);

        start_ui = list.items;
    }
}

pub fn drawUI(ui_elements: []UIElement) void {
    // const height = rl.getRenderHeight();
    // const width = rl.getRenderWidth();
    for (ui_elements) |element| {
        std.debug.print("{}", .{element});
    }
}
