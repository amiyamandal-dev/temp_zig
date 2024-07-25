const std = @import("std");

fn swap(arr: []i32, i: usize, j: usize) void {
    const temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
}

fn partition(arr: []i32, low: isize, high: isize) isize {
    const pivot = arr[@intCast(high)];
    var i = low - 1;

    var j: isize = low;
    while (j <= high - 1) : (j += 1) {
        if (arr[@intCast(j)] < pivot) {
            i += 1;
            swap(arr, @intCast(i), @intCast(j));
        }
    }
    swap(arr, @intCast(i + 1), @intCast(high));
    return i + 1;
}

fn quickSort(arr: []i32, low: isize, high: isize) void {
    if (low < high) {
        const pi = partition(arr, low, high);

        quickSort(arr, low, pi - 1);
        quickSort(arr, pi + 1, high);
    }
}

pub fn main() void {
    var arr = [_]i32{ 10, 7, 8, 9, 1, 5 };
    const n = arr.len;
    quickSort(arr[0..], 0, @intCast(n - 1));

    std.debug.print("Sorted array: ", .{});
    for (arr) |num| {
        std.debug.print("{d} ", .{num});
    }
    std.debug.print("\n", .{});
}
