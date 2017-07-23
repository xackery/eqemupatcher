package main

import (
	"crypto/md5"
	"fmt"
	"io"
	"os"
)

type ClientVersionData struct {
	FullName  string
	ShortName string
	Hash      string
}

func DetectClientVersion() (clientVersion *ClientVersionData, err error) {
	hash, err := DetectMD5("eqgame.exe")
	if err != nil {
		err = fmt.Errorf("Failed to detect client version: %s", err.Error())
		return
	}
	clientVersion = &ClientVersionData{
		Hash: hash,
	}
	switch hash {
	case "85218FC053D8B367F2B704BAC5E30ACC":
		clientVersion.FullName = "Secrets of Feydwer"
		clientVersion.ShortName = "sof"
	case "859E89987AA636D36B1007F11C2CD6E0":
	case "EF07EE6649C9A2BA2EFFC3F346388E1E78B44B48": //one of the torrented uf clients, used by B&R too
		clientVersion.FullName = "Underfoot"
		clientVersion.ShortName = "uf"
	case "A9DE1B8CC5C451B32084656FCACF1103": //p99 client
	case "BB42BC3870F59B6424A56FED3289C6D4": //vanilla titanium
		clientVersion.FullName = "Titanium"
		clientVersion.ShortName = "tit"
		break
	case "368BB9F425C8A55030A63E606D184445":
		clientVersion.FullName = "Rain of Fear"
		clientVersion.ShortName = "rof"
	case "240C80800112ADA825C146D7349CE85B":
	case "A057A23F030BAA1C4910323B131407105ACAD14D": //This is a custom ROF2 from a torrent download
		clientVersion.FullName = "Rain of Fear"
		clientVersion.ShortName = "rof"
	default:
		err = fmt.Errorf("Unrecognized client version: %s", hash)
	}
	return
}

func DetectMD5(filePath string) (hash string, err error) {
	f, err := os.Open(filePath)
	if err != nil {
		return
	}
	defer f.Close()

	h := md5.New()
	if _, err = io.Copy(h, f); err != nil {
		return
	}
	hash = fmt.Sprintf("%X", h.Sum(nil))
	return
}
