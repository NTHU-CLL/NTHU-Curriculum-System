import os, sys, PyPDF2

def pdfText2txt(pdf_path):
    fName = pdf_path.replace(".pdf", ".txt")
    if (os.path.exists(fName)):
        os.remove(fName)

    with open(fName, 'a', encoding='UTF-8') as fOut:
        with open(pdf_path, 'rb') as file:
            reader = PyPDF2.PdfReader(file)
            for page in reader.pages:
                page_text = page.extract_text()
                fOut.write(page_text+"\n")


if len(sys.argv) < 2:
    exit("Not enough parameters")

pdf_path = sys.argv[1]

pdfText2txt(pdf_path)

print("Done !!!")


