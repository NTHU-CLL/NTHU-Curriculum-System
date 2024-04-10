package basic

import (
	"io"
	"strings"

	"golang.org/x/text/encoding/unicode"
	"golang.org/x/text/transform"
)

func ReadFileUTF16(Bytes []byte) ([]byte, error) {
	win16be := unicode.UTF16(unicode.BigEndian, unicode.IgnoreBOM)
	utf16bom := unicode.BOMOverride(win16be.NewDecoder())
	unicodeReader := transform.NewReader(strings.NewReader(string(Bytes)), utf16bom)

	decoded, err := io.ReadAll(unicodeReader)
	return decoded, err
}
