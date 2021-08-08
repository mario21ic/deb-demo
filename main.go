package main

import (
  "fmt"
  "runtime"
)

func main() {
  fmt.Println("======\nHello World!")
  fmt.Println("OS: " + runtime.GOOS)
  fmt.Println("ARCH: " + runtime.GOARCH)
}
