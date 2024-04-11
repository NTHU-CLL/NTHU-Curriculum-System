package object

type Course struct {
	Code                   string `json:"\u79d1\u865f"`
	ChineseName            string `json:"\u8ab2\u7a0b\u4e2d\u6587\u540d\u7a31"`
	EnglishName            string `json:"\u8ab2\u7a0b\u82f1\u6587\u540d\u7a31"`
	Credits                string `json:"\u5b78\u5206\u6578"`
	Quota                  string `json:"\u4eba\u9650"`
	ReservedForNewStudents string `json:"\u65b0\u751f\u4fdd\u7559\u4eba\u6578"`
	TargetAudience         string `json:"\u901a\u8b58\u5c0d\u8c61"`
	CourseCategory         string `json:"\u901a\u8b58\u985e\u5225"`
	Language               string `json:"\u6388\u8ab2\u8a9e\u8a00"`
	Note                   string `json:"\u5099\u8a3b"`
	Inactive               string `json:"\u505c\u958b\u8a3b\u8a18"`
	ClassroomAndTime       string `json:"\u6559\u5ba4\u8207\u4e0a\u8ab2\u6642\u9593"`
	Instructors            string `json:"\u6388\u8ab2\u6559\u5e2b"`
	OtherInfo              string `json:"\u64cb\u4fee\u8aaa\u660e"`
	Restrictions           string `json:"\u8ab2\u7a0b\u9650\u5236\u8aaa\u660e"`
	MajorRelevance         string `json:"\u7b2c\u4e00\u4e8c\u5c08\u9577\u5c0d\u61c9"`
	CurriculaRelevance     string `json:"\u5b78\u5206\u5b78\u7a0b\u5c0d\u61c9"`
	NonAddable             string `json:"\u4e0d\u53ef\u52a0\u7c3d\u8aaa\u660e"`
	RequiredForDegree      string `json:"\u5fc5\u9078\u4fee\u8aaa\u660e"`
}
