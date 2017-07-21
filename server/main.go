package main

import ()

type ServerEntry struct {
	Name       string    `yaml:"name"`
	ShortName  string    `yaml:"shortName"`
	SourceUrl  string    `yaml:"sourceUrl"`
	LastUpdate time.Time `yaml:"lastUpdate"`
}

type ServerConfig struct {
	Servers []*Serverentry `yaml:"servers"`
}

func main() {

}
