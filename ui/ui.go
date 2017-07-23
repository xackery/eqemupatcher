package main

import (
	"fmt"

	"github.com/lxn/walk"
)

type UI struct {
	noProgressBtn    *walk.PushButton
	indeterminateBtn *walk.PushButton
	normalBtn        *walk.PushButton
	errBtn           *walk.PushButton
	pausedBtn        *walk.PushButton
	startBtn         *walk.PushButton
	serverListBox    *walk.ListBox
	serverList       *ServerModel
	progressBar      *walk.ProgressBar
	splashImg        *walk.ImageView
}

func (ui *UI) lb_CurrentIndexChanged() {
	i := ui.serverListBox.CurrentIndex()
	item := &ui.serverList.entries[i]

	//ui.te.SetText(item.value)

	fmt.Println("CurrentIndex: ", i)
	fmt.Println("CurrentEnvVarName: ", item.name)
}

func (ui *UI) lb_ItemActivated() {
	value := ui.serverList.entries[ui.serverListBox.CurrentIndex()].value

	fmt.Println("Value", value)
	//walk.MsgBox(ui.Dialog, "Value", value, walk.MsgBoxIconInformation)
}
