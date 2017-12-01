#!/usr/bin/env python3

import i3ipc

tabbed_ws = ['1', '2']

def def_layout_on_ws(i3, e):
    lv = e.current.leaves()
    print(lv)
    if len(lv) < 1:
        nm = e.current.workspace().name.split(":")[0]
        if nm in tabbed_ws:
            e.current.command("layout tabbed")
i3 = i3ipc.Connection()
i3.on("workspace::init", def_layout_on_ws)
i3.main()
