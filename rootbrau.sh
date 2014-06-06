#!/bin/bash

rootbrau(){
IFS= read -d '' macro << "EOF"
void onBrowserClose() {
    gApplication->Terminate(0);
}

void rootbrau(string fileName1){
    cout << "opening file " << fileName1 << "..." << endl;
    TFile *file1 = TFile::Open(fileName1.c_str());
    TBrowser *browser1 = new TBrowser;
    //TBrowser *browser1 = new TBrowser(file1);
    // Quit ROOT when the browser is closed.
    browser1->GetBrowserImp()->GetMainFrame()->Connect("CloseWindow()", 0, 0, "onBrowserClose()");
}
EOF

echo "${macro}" >> rootbrau.cpp
eval "root 'rootbrau.cpp(\"${1}\")'"
# (e.g. root 'rootbrau.cpp("test.root")')
rm rootbrau.cpp
}

rootbrau