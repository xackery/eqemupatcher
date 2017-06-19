//Super simple file list builder.
package main

import (
	"bufio"
	"crypto/md5"
	"fmt"
	"io"
	"io/ioutil"
	"log"
	"os"
	"path/filepath"
	"strings"
	"time"

	"github.com/go-yaml/yaml"
)

type FileList struct {
	Version        string      `yaml:"version,omitempty"`
	Deletes        []FileEntry `yaml:"deletes,omitempty"`
	DownloadPrefix string      `yaml:"downloadprefix,omitempty"`
	Downloads      []FileEntry `yaml:"downloads,omitempty"`
	Unpacks        []FileEntry `yaml:"unpacks,omitempty"`
}

type FileEntry struct {
	Name string `yaml:"name,omitempty"`
	Md5  string `yaml:"md5,omitempty"`
	Date string `yaml:"date,omitempty"`
	Size int64  `yaml:"size,omitempty"`
}

var fileList FileList

func main() {
	var err error
	var out []byte

	/*f := FileList{
		Version: "Test1",
		Downloads: []FileEntry{
			FileEntry{
				Name: "Test",
			},
		},
	}*/

	fileList.Version = time.Now().Format("20060102")
	fileList.DownloadPrefix = "http://rebuildeq.com/patch/"

	err = filepath.Walk(".", visit)
	if err != nil {
		log.Fatal("Error filepath", err.Error())
	}

	out, err = yaml.Marshal(&fileList)
	if err != nil {
		log.Fatal("Error marshalling:", err.Error())
	}
	ioutil.WriteFile("filelist.yml", out, 0644)

	log.Println("Wrote filelist.yml.")
}

func visit(path string, f os.FileInfo, err error) error {
	if strings.Contains(path, "filelistbuilder") || strings.Contains(path, "filelist") {
		return nil
	}

	if !f.IsDir() {

		//found a delete entry list
		if path == "delete.txt" {
			err = generateDeletes(path)

			//Don't conntinue.
			return nil
		}

		download := FileEntry{
			Size: f.Size(),
			Name: path,
			Date: f.ModTime().Format("20060102"),
		}
		var md5Val string
		if md5Val, err = getMd5(path); err != nil {
			log.Fatal("Failed to md5", path, err.Error())
		}
		download.Md5 = md5Val

		fileList.Downloads = append(fileList.Downloads, download)
	}
	return nil
}

func getMd5(path string) (value string, err error) {

	f, err := os.Open(path)
	if err != nil {
		log.Fatal(err)
	}
	defer f.Close()

	h := md5.New()
	if _, err = io.Copy(h, f); err != nil {
		return
	}
	value = fmt.Sprintf("%x", h.Sum(nil))
	return
}

func generateDeletes(path string) (err error) {
	file, err := os.Open(path)
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		data := scanner.Text()
		if strings.Contains(data, "#") { //Strip comments
			data = data[0:strings.Index(data, "#")]
		}
		if len(strings.TrimSpace(data)) < 1 { //skip empty lines
			continue
		}

		entry := FileEntry{
			Name: data,
		}

		fileList.Deletes = append(fileList.Deletes, entry)
	}

	if err := scanner.Err(); err != nil {
		log.Fatal(err)
	}
	return
}
