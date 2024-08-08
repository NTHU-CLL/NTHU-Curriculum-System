import sys, csv, PyPDF2

def pdfLink2csv(pdf_path):
    with open(pdf_path.replace(".pdf", ".csv"), 'w', newline='') as csvfile:
        writer = csv.writer(csvfile)

        with open(pdf_path, 'rb') as file:
            reader = PyPDF2.PdfReader(file)
            writer.writerow(['Code', 'Url'])

            for page in reader.pages:
                page_text = page.extract_text()
                page_links = []
    
                if '/Annots' in page:
                    for annot in page['/Annots']:
                        obj = annot.get_object()
                        if obj['/Subtype'] == '/Link' and '/A' in obj and '/URI' in obj['/A']:
                            page_links.append(obj['/A']['/URI'])
    
                    classID = page_text.split("：")[1].replace("學分", "").replace("\n", "").replace("Credit", "").strip()
                    link = page_links[0]
                    writer.writerow([classID, link])


if len(sys.argv) < 2:
    exit("Not enough parameters")

pdf_path = sys.argv[1]

pdfLink2csv(pdf_path)

print("Done !!!")


