package main

import (
	"github.com/lxn/walk"
)

type ServerEntry struct {
	name  string
	value string
}

type ServerModel struct {
	walk.ListModelBase
	entries []ServerEntry
}

func BuildServerList() (serverModel *ServerModel) {
	serverModel = &ServerModel{
		entries: []ServerEntry{
			ServerEntry{
				name:  "Test1",
				value: "test2",
			},
			ServerEntry{
				name:  "Test3",
				value: "test4",
			},
		},
	}
	return
}

func (m *ServerModel) ItemCount() int {
	return len(m.entries)
}

func (m *ServerModel) Value(index int) interface{} {
	return m.entries[index].name
}
