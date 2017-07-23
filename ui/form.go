package main

import (
	"fmt"
	"log"
	"time"

	"github.com/lxn/walk"
)

type Form struct {
	*walk.Dialog
	ui UI
}

func NewForm(owner walk.Form) (int, error) {
	form := new(Form)
	if err := form.init(owner); err != nil {
		return 0, err
	}
	form.SetTitle("EQEmuPatcher")

	form.ProgressIndicator().SetTotal(100)

	form.ui.indeterminateBtn.Clicked().Attach(func() {
		fmt.Println("SetState indeterminate")
		form.setState(walk.PIIndeterminate)
	})
	form.ui.noProgressBtn.Clicked().Attach(func() {
		fmt.Println("SetState noprogress")
		form.setState(walk.PINoProgress)
	})

	form.ui.normalBtn.Clicked().Attach(func() {
		fmt.Println("SetState normal")
		form.setState(walk.PINormal)
	})

	form.ui.errBtn.Clicked().Attach(func() {
		fmt.Println("SetState error")
		form.setState(walk.PIError)
	})

	form.ui.pausedBtn.Clicked().Attach(func() {
		fmt.Println("SetState paused")
		form.setState(walk.PIPaused)
	})

	form.ui.startBtn.Clicked().Attach(func() {
		go func() {
			form.ProgressIndicator().SetTotal(100)
			var i uint32
			for i = 0; i < 100; i++ {
				fmt.Println("SetProgress", i)
				time.Sleep(100 * time.Millisecond)
				if err := form.ProgressIndicator().SetCompleted(i); err != nil {
					log.Print(err)
				}
			}
		}()
	})
	form.ui.serverListBox.CurrentIndexChanged().Attach(form.ui.lb_CurrentIndexChanged)
	form.ui.serverListBox.ItemActivated().Attach(form.ui.lb_ItemActivated)

	return form.Run(), nil
}

func (form *Form) setState(state walk.PIState) {
	if err := form.ProgressIndicator().SetState(state); err != nil {
		log.Print(err)
	}
	//form.ui.progressBar.SetBackground(state)
}

func (form *Form) setProgress(value int) {
	form.ui.progressBar.SetValue(value)
	form.ProgressIndicator().SetCompleted(uint32(value))
}

func (form *Form) init(owner walk.Form) (err error) {

	if form.Dialog, err = walk.NewDialog(owner); err != nil {
		return err
	}

	succeeded := false
	defer func() {
		if !succeeded {
			form.Dispose()
		}
	}()

	var font *walk.Font
	if font == nil {
		font = nil
	}

	form.SetName("Dialog")

	form.SetMinMaxSize(walk.Size{305, 371}, walk.Size{0, 0})
	if err := form.SetClientSize(walk.Size{432, 611}); err != nil {
		return err
	}
	if err := form.SetTitle(`Dialog`); err != nil {
		return err
	}

	// noProgressBtn
	if form.ui.noProgressBtn, err = walk.NewPushButton(form); err != nil {
		return err
	}
	form.ui.noProgressBtn.SetName("noProgressBtn")
	if err := form.ui.noProgressBtn.SetBounds(walk.Rectangle{40, 60, 161, 23}); err != nil {
		return err
	}
	if err := form.ui.noProgressBtn.SetText(`NoProgress`); err != nil {
		return err
	}
	if err := form.ui.noProgressBtn.SetMinMaxSize(walk.Size{0, 0}, walk.Size{161, 16777215}); err != nil {
		return err
	}

	// indeterminateBtn
	if form.ui.indeterminateBtn, err = walk.NewPushButton(form.Dialog); err != nil {
		return err
	}
	form.ui.indeterminateBtn.SetName("indeterminateBtn")
	if err := form.ui.indeterminateBtn.SetBounds(walk.Rectangle{40, 90, 161, 23}); err != nil {
		return err
	}
	if err := form.ui.indeterminateBtn.SetText(`Indeterminate`); err != nil {
		return err
	}
	if err := form.ui.indeterminateBtn.SetMinMaxSize(walk.Size{0, 0}, walk.Size{161, 16777215}); err != nil {
		return err
	}

	// normalBtn
	if form.ui.normalBtn, err = walk.NewPushButton(form.Dialog); err != nil {
		return err
	}
	form.ui.normalBtn.SetName("normalBtn")
	if err := form.ui.normalBtn.SetBounds(walk.Rectangle{40, 120, 161, 23}); err != nil {
		return err
	}
	if err := form.ui.normalBtn.SetText(`Normal`); err != nil {
		return err
	}
	if err := form.ui.normalBtn.SetMinMaxSize(walk.Size{0, 0}, walk.Size{161, 16777215}); err != nil {
		return err
	}

	// errBtn
	if form.ui.errBtn, err = walk.NewPushButton(form.Dialog); err != nil {
		return err
	}
	form.ui.errBtn.SetName("errBtn")
	if err := form.ui.errBtn.SetBounds(walk.Rectangle{40, 150, 161, 23}); err != nil {
		return err
	}
	if err := form.ui.errBtn.SetText(`Error`); err != nil {
		return err
	}

	// pausedBtn
	if form.ui.pausedBtn, err = walk.NewPushButton(form.Dialog); err != nil {
		return err
	}
	form.ui.pausedBtn.SetName("pausedBtn")
	if err := form.ui.pausedBtn.SetBounds(walk.Rectangle{40, 180, 161, 23}); err != nil {
		return err
	}
	if err := form.ui.pausedBtn.SetText(`Paused`); err != nil {
		return err
	}

	// startBtn
	if form.ui.startBtn, err = walk.NewPushButton(form.Dialog); err != nil {
		return err
	}
	form.ui.startBtn.SetName("startBtn")
	if err := form.ui.startBtn.SetBounds(walk.Rectangle{290, 180, 75, 23}); err != nil {
		return err
	}
	if err := form.ui.startBtn.SetText(`START`); err != nil {
		return err
	}

	if form.ui.serverListBox, err = walk.NewListBox(form.Dialog); err != nil {
		return err
	}
	if err := form.ui.serverListBox.SetBounds(walk.Rectangle{290, 200, 100, 100}); err != nil {
		return err
	}
	form.ui.serverList = BuildServerList()
	form.ui.serverListBox.SetModel(form.ui.serverList)

	if form.ui.splashImg, err = walk.NewImageView(form.Dialog); err != nil {
		return err
	}
	if err := form.ui.splashImg.SetBounds(walk.Rectangle{10, 6, 400, 450}); err != nil {
		return err
	}

	if form.ui.progressBar, err = walk.NewProgressBar(form.Dialog); err != nil {
		return err
	}
	if err := form.ui.progressBar.SetBounds(walk.Rectangle{10, 521, 400, 39}); err != nil {
		return err
	}
	form.ui.progressBar.SetValue(50)
	// Tab order

	succeeded = true

	client, err := DetectClientVersion()
	if err != nil {
		walk.MsgBox(form.Dialog, "Error Detecting Client", err.Error(), walk.MsgBoxIconError)
		return err
	}
	form.SetTitle(client.FullName)
	fmt.Println(client.FullName)

	//walk.MsgBox(w, "Success?", "Scucess!", walk.MsgBoxOK)
	return nil
}
