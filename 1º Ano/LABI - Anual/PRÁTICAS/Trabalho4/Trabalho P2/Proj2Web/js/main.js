//Toggle para sinalizar os quadrados activos
function toggle1(obj){
	var square = document.getElementById(obj);
	if(square.style.color == "white"){
		square.style.color = "red";   
		square.style.backgroundColor = "#0088a9"
		}
	else{square.style.color = "white";
		square.style.backgroundColor = "gray"
		}
}

//Toggle igual ao anterior mas a cor base é diferente
function toggle2(obj){
	var square = document.getElementById(obj);
	if(square.style.color == "white"){
		square.style.color = "red";   
		square.style.backgroundColor = "#0088a9"
		}
	else{square.style.color = "white";
		square.style.backgroundColor = "#495057"
		}
}

function playTrack(){
	var beat = 15000/document.getElementById("tempo").value;
	variables();
	console.log("Start");
	loop1 = setTimeout(track,0);
	loop2 = setTimeout(playTrack,16*beat);
}

function stopTrack(){
	variables();
	console.log("Stop");
	clearTimeout(loop1);
	clearTimeout(loop2);
}

function track(){
	setTimeout(CircleAnimation(),0);
	var beat = 15000/document.getElementById("tempo").value;
	
	drums();
	chords();
	melody();
}

function chords(){
	var beat = 15000/document.getElementById("tempo").value;
	
	if(Chord1.options.selectedIndex == 1) {setTimeout(Cmaj,0); setTimeout(CmajStop,4*beat);}
	if(Chord1.options.selectedIndex == 2) {setTimeout(Dmin,0); setTimeout(DminStop,4*beat);}
	if(Chord1.options.selectedIndex == 3) {setTimeout(Emin,0); setTimeout(EminStop,4*beat);}
	if(Chord1.options.selectedIndex == 4) {setTimeout(Fmaj,0); setTimeout(FmajStop,4*beat);}
	if(Chord1.options.selectedIndex == 5) {setTimeout(Gmaj,0); setTimeout(GmajStop,4*beat);}
	if(Chord1.options.selectedIndex == 6) {setTimeout(Amin,0); setTimeout(AminStop,4*beat);}
	if(Chord1.options.selectedIndex == 7) {setTimeout(Bdim,0); setTimeout(BdimStop,4*beat);}
		
	if(Chord2.options.selectedIndex == 1) {setTimeout(Cmaj,4*beat); setTimeout(CmajStop,8*beat);}
	if(Chord2.options.selectedIndex == 2) {setTimeout(Dmin,4*beat); setTimeout(DminStop,8*beat);}
	if(Chord2.options.selectedIndex == 3) {setTimeout(Emin,4*beat); setTimeout(EminStop,8*beat);}
	if(Chord2.options.selectedIndex == 4) {setTimeout(Fmaj,4*beat); setTimeout(FmajStop,8*beat);}
	if(Chord2.options.selectedIndex == 5) {setTimeout(Gmaj,4*beat); setTimeout(GmajStop,8*beat);}
	if(Chord2.options.selectedIndex == 6) {setTimeout(Amin,4*beat); setTimeout(AminStop,8*beat);}
	if(Chord2.options.selectedIndex == 7) {setTimeout(Bdim,4*beat); setTimeout(BdimStop,8*beat);}
	
	if(Chord3.options.selectedIndex == 1) {setTimeout(Cmaj,8*beat); setTimeout(CmajStop,12*beat);}
	if(Chord3.options.selectedIndex == 2) {setTimeout(Dmin,8*beat); setTimeout(DminStop,12*beat);}
	if(Chord3.options.selectedIndex == 3) {setTimeout(Emin,8*beat); setTimeout(EminStop,12*beat);}
	if(Chord3.options.selectedIndex == 4) {setTimeout(Fmaj,8*beat); setTimeout(FmajStop,12*beat);}
	if(Chord3.options.selectedIndex == 5) {setTimeout(Gmaj,8*beat); setTimeout(GmajStop,12*beat);}
	if(Chord3.options.selectedIndex == 6) {setTimeout(Amin,8*beat); setTimeout(AminStop,12*beat);}
	if(Chord3.options.selectedIndex == 7) {setTimeout(Bdim,8*beat); setTimeout(BdimStop,12*beat);}
		
	if(Chord4.options.selectedIndex == 1) {setTimeout(Cmaj,12*beat); setTimeout(CmajStop,16*beat);}
	if(Chord4.options.selectedIndex == 2) {setTimeout(Dmin,12*beat); setTimeout(DminStop,16*beat);}
	if(Chord4.options.selectedIndex == 3) {setTimeout(Emin,12*beat); setTimeout(EminStop,16*beat);}
	if(Chord4.options.selectedIndex == 4) {setTimeout(Fmaj,12*beat); setTimeout(FmajStop,16*beat);}
	if(Chord4.options.selectedIndex == 5) {setTimeout(Gmaj,12*beat); setTimeout(GmajStop,16*beat);}
	if(Chord4.options.selectedIndex == 6) {setTimeout(Amin,12*beat); setTimeout(AminStop,16*beat);}
	if(Chord4.options.selectedIndex == 7) {setTimeout(Bdim,12*beat); setTimeout(BdimStop,16*beat);}
}

function melody(){
	var beat = 15000/document.getElementById("tempo").value;
	
	if(C1.style.color == "red") {setTimeout(Cnote,0); setTimeout(CnoteStop,1*beat);}
	if(C2.style.color == "red") {setTimeout(Cnote,1*beat); setTimeout(CnoteStop,2*beat);}
	if(C3.style.color == "red") {setTimeout(Cnote,2*beat); setTimeout(CnoteStop,3*beat);}
	if(C4.style.color == "red") {setTimeout(Cnote,3*beat); setTimeout(CnoteStop,4*beat);}
	if(C5.style.color == "red") {setTimeout(Cnote,4*beat); setTimeout(CnoteStop,5*beat);}
	if(C6.style.color == "red") {setTimeout(Cnote,5*beat); setTimeout(CnoteStop,6*beat);}
	if(C7.style.color == "red") {setTimeout(Cnote,6*beat); setTimeout(CnoteStop,7*beat);}
	if(C8.style.color == "red") {setTimeout(Cnote,7*beat); setTimeout(CnoteStop,8*beat);}
	if(C9.style.color == "red") {setTimeout(Cnote,8*beat); setTimeout(CnoteStop,9*beat);}
	if(C10.style.color == "red") {setTimeout(Cnote,9*beat); setTimeout(CnoteStop,10*beat);}
	if(C11.style.color == "red") {setTimeout(Cnote,10*beat); setTimeout(CnoteStop,11*beat);}
	if(C12.style.color == "red") {setTimeout(Cnote,11*beat); setTimeout(CnoteStop,12*beat);}
	if(C13.style.color == "red") {setTimeout(Cnote,12*beat); setTimeout(CnoteStop,13*beat);}
	if(C14.style.color == "red") {setTimeout(Cnote,13*beat); setTimeout(CnoteStop,14*beat);}
	if(C15.style.color == "red") {setTimeout(Cnote,14*beat); setTimeout(CnoteStop,15*beat);}
	if(C16.style.color == "red") {setTimeout(Cnote,15*beat); setTimeout(CnoteStop,16*beat);}
	
	if(D1.style.color == "red") {setTimeout(Dnote,0); setTimeout(DnoteStop,1*beat);}
	if(D2.style.color == "red") {setTimeout(Dnote,1*beat); setTimeout(DnoteStop,2*beat);}
	if(D3.style.color == "red") {setTimeout(Dnote,2*beat); setTimeout(DnoteStop,3*beat);}
	if(D4.style.color == "red") {setTimeout(Dnote,3*beat); setTimeout(DnoteStop,4*beat);}
	if(D5.style.color == "red") {setTimeout(Dnote,4*beat); setTimeout(DnoteStop,5*beat);}
	if(D6.style.color == "red") {setTimeout(Dnote,5*beat); setTimeout(DnoteStop,6*beat);}
	if(D7.style.color == "red") {setTimeout(Dnote,6*beat); setTimeout(DnoteStop,7*beat);}
	if(D8.style.color == "red") {setTimeout(Dnote,7*beat); setTimeout(DnoteStop,8*beat);}
	if(D9.style.color == "red") {setTimeout(Dnote,8*beat); setTimeout(DnoteStop,9*beat);}
	if(D10.style.color == "red") {setTimeout(Dnote,9*beat); setTimeout(DnoteStop,10*beat);}
	if(D11.style.color == "red") {setTimeout(Dnote,10*beat); setTimeout(DnoteStop,11*beat);}
	if(D12.style.color == "red") {setTimeout(Dnote,11*beat); setTimeout(DnoteStop,12*beat);}
	if(D13.style.color == "red") {setTimeout(Dnote,12*beat); setTimeout(DnoteStop,13*beat);}
	if(D14.style.color == "red") {setTimeout(Dnote,13*beat); setTimeout(DnoteStop,14*beat);}
	if(D15.style.color == "red") {setTimeout(Dnote,14*beat); setTimeout(DnoteStop,15*beat);}
	if(D16.style.color == "red") {setTimeout(Dnote,15*beat); setTimeout(DnoteStop,16*beat);}
	
	if(E1.style.color == "red") {setTimeout(Enote,0); setTimeout(EnoteStop,1*beat);}
	if(E2.style.color == "red") {setTimeout(Enote,1*beat); setTimeout(EnoteStop,2*beat);}
	if(E3.style.color == "red") {setTimeout(Enote,2*beat); setTimeout(EnoteStop,3*beat);}
	if(E4.style.color == "red") {setTimeout(Enote,3*beat); setTimeout(EnoteStop,4*beat);}
	if(E5.style.color == "red") {setTimeout(Enote,4*beat); setTimeout(EnoteStop,5*beat);}
	if(E6.style.color == "red") {setTimeout(Enote,5*beat); setTimeout(EnoteStop,6*beat);}
	if(E7.style.color == "red") {setTimeout(Enote,6*beat); setTimeout(EnoteStop,7*beat);}
	if(E8.style.color == "red") {setTimeout(Enote,7*beat); setTimeout(EnoteStop,8*beat);}
	if(E9.style.color == "red") {setTimeout(Enote,8*beat); setTimeout(EnoteStop,9*beat);}
	if(E10.style.color == "red") {setTimeout(Enote,9*beat); setTimeout(EnoteStop,10*beat);}
	if(E11.style.color == "red") {setTimeout(Enote,10*beat); setTimeout(EnoteStop,11*beat);}
	if(E12.style.color == "red") {setTimeout(Enote,11*beat); setTimeout(EnoteStop,12*beat);}
	if(E13.style.color == "red") {setTimeout(Enote,12*beat); setTimeout(EnoteStop,13*beat);}
	if(E14.style.color == "red") {setTimeout(Enote,13*beat); setTimeout(EnoteStop,14*beat);}
	if(E15.style.color == "red") {setTimeout(Enote,14*beat); setTimeout(EnoteStop,15*beat);}
	if(E16.style.color == "red") {setTimeout(Enote,15*beat); setTimeout(EnoteStop,16*beat);}
	
	if(F1.style.color == "red") {setTimeout(Fnote,0); setTimeout(FnoteStop,1*beat);}
	if(F2.style.color == "red") {setTimeout(Fnote,1*beat); setTimeout(FnoteStop,2*beat);}
	if(F3.style.color == "red") {setTimeout(Fnote,2*beat); setTimeout(FnoteStop,3*beat);}
	if(F4.style.color == "red") {setTimeout(Fnote,3*beat); setTimeout(FnoteStop,4*beat);}
	if(F5.style.color == "red") {setTimeout(Fnote,4*beat); setTimeout(FnoteStop,5*beat);}
	if(F6.style.color == "red") {setTimeout(Fnote,5*beat); setTimeout(FnoteStop,6*beat);}
	if(F7.style.color == "red") {setTimeout(Fnote,6*beat); setTimeout(FnoteStop,7*beat);}
	if(F8.style.color == "red") {setTimeout(Fnote,7*beat); setTimeout(FnoteStop,8*beat);}
	if(F9.style.color == "red") {setTimeout(Fnote,8*beat); setTimeout(FnoteStop,9*beat);}
	if(F10.style.color == "red") {setTimeout(Fnote,9*beat); setTimeout(FnoteStop,10*beat);}
	if(F11.style.color == "red") {setTimeout(Fnote,10*beat); setTimeout(FnoteStop,11*beat);}
	if(F12.style.color == "red") {setTimeout(Fnote,11*beat); setTimeout(FnoteStop,12*beat);}
	if(F13.style.color == "red") {setTimeout(Fnote,12*beat); setTimeout(FnoteStop,13*beat);}
	if(F14.style.color == "red") {setTimeout(Fnote,13*beat); setTimeout(FnoteStop,14*beat);}
	if(F15.style.color == "red") {setTimeout(Fnote,14*beat); setTimeout(FnoteStop,15*beat);}
	if(F16.style.color == "red") {setTimeout(Fnote,15*beat); setTimeout(FnoteStop,16*beat);}
	
	if(G1.style.color == "red") {setTimeout(Gnote,0); setTimeout(GnoteStop,1*beat);}
	if(G2.style.color == "red") {setTimeout(Gnote,1*beat); setTimeout(GnoteStop,2*beat);}
	if(G3.style.color == "red") {setTimeout(Gnote,2*beat); setTimeout(GnoteStop,3*beat);}
	if(G4.style.color == "red") {setTimeout(Gnote,3*beat); setTimeout(GnoteStop,4*beat);}
	if(G5.style.color == "red") {setTimeout(Gnote,4*beat); setTimeout(GnoteStop,5*beat);}
	if(G6.style.color == "red") {setTimeout(Gnote,5*beat); setTimeout(GnoteStop,6*beat);}
	if(G7.style.color == "red") {setTimeout(Gnote,6*beat); setTimeout(GnoteStop,7*beat);}
	if(G8.style.color == "red") {setTimeout(Gnote,7*beat); setTimeout(GnoteStop,8*beat);}
	if(G9.style.color == "red") {setTimeout(Gnote,8*beat); setTimeout(GnoteStop,9*beat);}
	if(G10.style.color == "red") {setTimeout(Gnote,9*beat); setTimeout(GnoteStop,10*beat);}
	if(G11.style.color == "red") {setTimeout(Gnote,10*beat); setTimeout(GnoteStop,11*beat);}
	if(G12.style.color == "red") {setTimeout(Gnote,11*beat); setTimeout(GnoteStop,12*beat);}
	if(G13.style.color == "red") {setTimeout(Gnote,12*beat); setTimeout(GnoteStop,13*beat);}
	if(G14.style.color == "red") {setTimeout(Gnote,13*beat); setTimeout(GnoteStop,14*beat);}
	if(G15.style.color == "red") {setTimeout(Gnote,14*beat); setTimeout(GnoteStop,15*beat);}
	if(G16.style.color == "red") {setTimeout(Gnote,15*beat); setTimeout(GnoteStop,16*beat);}
	
	if(A1.style.color == "red") {setTimeout(Anote,0); setTimeout(AnoteStop,1*beat);}
	if(A2.style.color == "red") {setTimeout(Anote,1*beat); setTimeout(AnoteStop,2*beat);}
	if(A3.style.color == "red") {setTimeout(Anote,2*beat); setTimeout(AnoteStop,3*beat);}
	if(A4.style.color == "red") {setTimeout(Anote,3*beat); setTimeout(AnoteStop,4*beat);}
	if(A5.style.color == "red") {setTimeout(Anote,4*beat); setTimeout(AnoteStop,5*beat);}
	if(A6.style.color == "red") {setTimeout(Anote,5*beat); setTimeout(AnoteStop,6*beat);}
	if(A7.style.color == "red") {setTimeout(Anote,6*beat); setTimeout(AnoteStop,7*beat);}
	if(A8.style.color == "red") {setTimeout(Anote,7*beat); setTimeout(AnoteStop,8*beat);}
	if(A9.style.color == "red") {setTimeout(Anote,8*beat); setTimeout(AnoteStop,9*beat);}
	if(A10.style.color == "red") {setTimeout(Anote,9*beat); setTimeout(AnoteStop,10*beat);}
	if(A11.style.color == "red") {setTimeout(Anote,10*beat); setTimeout(AnoteStop,11*beat);}
	if(A12.style.color == "red") {setTimeout(Anote,11*beat); setTimeout(AnoteStop,12*beat);}
	if(A13.style.color == "red") {setTimeout(Anote,12*beat); setTimeout(AnoteStop,13*beat);}
	if(A14.style.color == "red") {setTimeout(Anote,13*beat); setTimeout(AnoteStop,14*beat);}
	if(A15.style.color == "red") {setTimeout(Anote,14*beat); setTimeout(AnoteStop,15*beat);}
	if(A16.style.color == "red") {setTimeout(Anote,15*beat); setTimeout(AnoteStop,16*beat);}
	
	if(B1.style.color == "red") {setTimeout(Bnote,0); setTimeout(BnoteStop,1*beat);}
	if(B2.style.color == "red") {setTimeout(Bnote,1*beat); setTimeout(BnoteStop,2*beat);}
	if(B3.style.color == "red") {setTimeout(Bnote,2*beat); setTimeout(BnoteStop,3*beat);}
	if(B4.style.color == "red") {setTimeout(Bnote,3*beat); setTimeout(BnoteStop,4*beat);}
	if(B5.style.color == "red") {setTimeout(Bnote,4*beat); setTimeout(BnoteStop,5*beat);}
	if(B6.style.color == "red") {setTimeout(Bnote,5*beat); setTimeout(BnoteStop,6*beat);}
	if(B7.style.color == "red") {setTimeout(Bnote,6*beat); setTimeout(BnoteStop,7*beat);}
	if(B8.style.color == "red") {setTimeout(Bnote,7*beat); setTimeout(BnoteStop,8*beat);}
	if(B9.style.color == "red") {setTimeout(Bnote,8*beat); setTimeout(BnoteStop,9*beat);}
	if(B10.style.color == "red") {setTimeout(Bnote,9*beat); setTimeout(BnoteStop,10*beat);}
	if(B11.style.color == "red") {setTimeout(Bnote,10*beat); setTimeout(BnoteStop,11*beat);}
	if(B12.style.color == "red") {setTimeout(Bnote,11*beat); setTimeout(BnoteStop,12*beat);}
	if(B13.style.color == "red") {setTimeout(Bnote,12*beat); setTimeout(BnoteStop,13*beat);}
	if(B14.style.color == "red") {setTimeout(Bnote,13*beat); setTimeout(BnoteStop,14*beat);}
	if(B15.style.color == "red") {setTimeout(Bnote,14*beat); setTimeout(BnoteStop,15*beat);}
	if(B16.style.color == "red") {setTimeout(Bnote,15*beat); setTimeout(BnoteStop,16*beat);}
}

function drums(){
	var beat = 15000/document.getElementById("tempo").value;
	
	if(H1.style.color == "red") setTimeout(Hihat,0); 
	if(H2.style.color == "red") setTimeout(Hihat,1*beat); 
	if(H3.style.color == "red") setTimeout(Hihat,2*beat); 
	if(H4.style.color == "red") setTimeout(Hihat,3*beat); 
	if(H5.style.color == "red") setTimeout(Hihat,4*beat); 
	if(H6.style.color == "red") setTimeout(Hihat,5*beat); 
	if(H7.style.color == "red") setTimeout(Hihat,6*beat); 
	if(H8.style.color == "red") setTimeout(Hihat,7*beat); 
	if(H9.style.color == "red") setTimeout(Hihat,8*beat); 
	if(H10.style.color == "red") setTimeout(Hihat,9*beat); 
	if(H11.style.color == "red") setTimeout(Hihat,10*beat); 
	if(H12.style.color == "red") setTimeout(Hihat,11*beat); 
	if(H13.style.color == "red") setTimeout(Hihat,12*beat); 
	if(H14.style.color == "red") setTimeout(Hihat,13*beat); 
	if(H15.style.color == "red") setTimeout(Hihat,14*beat); 
	if(H16.style.color == "red") setTimeout(Hihat,15*beat); 
	
	if(T1.style.color == "red") setTimeout(Tom,0); 
	if(T2.style.color == "red") setTimeout(Tom,1*beat); 
	if(T3.style.color == "red") setTimeout(Tom,2*beat); 
	if(T4.style.color == "red") setTimeout(Tom,3*beat); 
	if(T5.style.color == "red") setTimeout(Tom,4*beat); 
	if(T6.style.color == "red") setTimeout(Tom,5*beat);
	if(T7.style.color == "red") setTimeout(Tom,6*beat); 
	if(T8.style.color == "red") setTimeout(Tom,7*beat); 
	if(T9.style.color == "red") setTimeout(Tom,8*beat); 
	if(T10.style.color == "red") setTimeout(Tom,9*beat); 
	if(T11.style.color == "red") setTimeout(Tom,10*beat); 
	if(T12.style.color == "red") setTimeout(Tom,11*beat); 
	if(T13.style.color == "red") setTimeout(Tom,12*beat); 
	if(T14.style.color == "red") setTimeout(Tom,13*beat); 
	if(T15.style.color == "red") setTimeout(Tom,14*beat); 
	if(T16.style.color == "red") setTimeout(Tom,15*beat); 
	
	if(S1.style.color == "red") setTimeout(Clap,0); 
	if(S2.style.color == "red") setTimeout(Clap,1*beat);
	if(S3.style.color == "red") setTimeout(Clap,2*beat); 
	if(S4.style.color == "red") setTimeout(Clap,3*beat); 
	if(S5.style.color == "red") setTimeout(Clap,4*beat); 
	if(S6.style.color == "red") setTimeout(Clap,5*beat); 
	if(S7.style.color == "red") setTimeout(Clap,6*beat); 
	if(S8.style.color == "red") setTimeout(Clap,7*beat); 
	if(S9.style.color == "red") setTimeout(Clap,8*beat); 
	if(S10.style.color == "red") setTimeout(Clap,9*beat); 
	if(S11.style.color == "red") setTimeout(Clap,10*beat); 
	if(S12.style.color == "red") setTimeout(Clap,11*beat); 
	if(S13.style.color == "red") setTimeout(Clap,12*beat);
	if(S14.style.color == "red") setTimeout(Clap,13*beat); 
	if(S15.style.color == "red") setTimeout(Clap,14*beat); 
	if(S16.style.color == "red") setTimeout(Clap,15*beat); 
	
	if(K1.style.color == "red") setTimeout(Kick,0); 
	if(K2.style.color == "red") setTimeout(Kick,1*beat); 
	if(K3.style.color == "red") setTimeout(Kick,2*beat); 
	if(K4.style.color == "red") setTimeout(Kick,3*beat); 
	if(K5.style.color == "red") setTimeout(Kick,4*beat); 
	if(K6.style.color == "red") setTimeout(Kick,5*beat); 
	if(K7.style.color == "red") setTimeout(Kick,6*beat); 
	if(K8.style.color == "red") setTimeout(Kick,7*beat);
	if(K9.style.color == "red") setTimeout(Kick,8*beat); 
	if(K10.style.color == "red") setTimeout(Kick,9*beat); 
	if(K11.style.color == "red") setTimeout(Kick,10*beat); 
	if(K12.style.color == "red") setTimeout(Kick,11*beat); 
	if(K13.style.color == "red") setTimeout(Kick,12*beat); 
	if(K14.style.color == "red") setTimeout(Kick,13*beat); 
	if(K15.style.color == "red") setTimeout(Kick,14*beat); 
	if(K16.style.color == "red") setTimeout(Kick,15*beat); 
}

//Sounds Functions
function Kick(){
	document.getElementById("KICK").currentTime = 0;
	document.getElementById("KICK").play()}
function KickStop(){document.getElementById("KICK").pause()}

function Clap(){
	document.getElementById("CLAP").currentTime = 0;
	document.getElementById("CLAP").play()}
function ClapStop(){document.getElementById("CLAP").pause()}

function Tom(){
	document.getElementById("TOM").currentTime = 0;
	document.getElementById("TOM").play()}
function TomStop(){document.getElementById("TOM").pause()}

function Hihat(){
	document.getElementById("HIHAT").currentTime = 0;
	document.getElementById("HIHAT").play()}
function HihatStop(){document.getElementById("HIHAT").pause()}

function Cmaj(){
	document.getElementById("CMAJ").currentTime = 0;
	document.getElementById("CMAJ").play()}
function CmajStop(){document.getElementById("CMAJ").pause()}

function Dmin(){
	document.getElementById("DMIN").currentTime = 0;
	document.getElementById("DMIN").play()}
function DminStop(){document.getElementById("DMIN").pause()}

function Emin(){
	document.getElementById("EMIN").currentTime = 0;
	document.getElementById("EMIN").play()}
function EminStop(){document.getElementById("EMIN").pause()}

function Fmaj(){
	document.getElementById("FMAJ").currentTime = 0;
	document.getElementById("FMAJ").play()}
function FmajStop(){document.getElementById("FMAJ").pause()}

function Gmaj(){
	document.getElementById("GMAJ").currentTime = 0;
	document.getElementById("GMAJ").play()}
function GmajStop(){document.getElementById("GMAJ").pause()}

function Amin(){
	document.getElementById("AMIN").currentTime = 0;
	document.getElementById("AMIN").play()}
function AminStop(){document.getElementById("AMIN").pause()}

function Bdim(){
	document.getElementById("BDIM").currentTime = 0;
	document.getElementById("BDIM").play()}
function BdimStop(){document.getElementById("BDIM").pause()}

function Cnote(){
	document.getElementById("Cnote").currentTime = 0;
	document.getElementById("Cnote").play()}
function CnoteStop(){document.getElementById("Cnote").pause()}

function Dnote(){
	document.getElementById("Dnote").currentTime = 0;
	document.getElementById("Dnote").play()}
function DnoteStop(){document.getElementById("Dnote").pause()}

function Enote(){
	document.getElementById("Enote").currentTime = 0;
	document.getElementById("Enote").play()}
function EnoteStop(){document.getElementById("Enote").pause()}

function Fnote(){
	document.getElementById("Fnote").currentTime = 0;
	document.getElementById("Fnote").play()}
function FnoteStop(){document.getElementById("Fnote").pause()}

function Gnote(){
	document.getElementById("Gnote").currentTime = 0;
	document.getElementById("Gnote").play()}
function GnoteStop(){document.getElementById("Gnote").pause()}

function Anote(){
	document.getElementById("Anote").currentTime = 0;
	document.getElementById("Anote").play()}
function AnoteStop(){document.getElementById("Anote").pause()}

function Bnote(){
	document.getElementById("Bnote").currentTime = 0;
	document.getElementById("Bnote").play()}
function BnoteStop(){document.getElementById("Bnote").pause()}

//Timing Animation
function CircleAnimation(obj){
	var beat = 15000/document.getElementById("tempo").value;
	var end  = beat * 4/5;
	
	
	setTimeout(frame1,0);
	setTimeout(frame2,0+end);
	setTimeout(frame3,1*beat);
	setTimeout(frame4,1*beat+end);
	setTimeout(frame5,2*beat);
	setTimeout(frame6,2*beat+end);
	setTimeout(frame7,3*beat);
	setTimeout(frame8,3*beat+end);
	setTimeout(frame9,4*beat);
	setTimeout(frame10,4*beat+end);
	setTimeout(frame11,5*beat);
	setTimeout(frame12,5*beat+end);
	setTimeout(frame13,6*beat);
	setTimeout(frame14,6*beat+end);
	setTimeout(frame15,7*beat);
	setTimeout(frame16,7*beat+end);
	setTimeout(frame17,8*beat);
	setTimeout(frame18,8*beat+end);
	setTimeout(frame19,9*beat);
	setTimeout(frame20,9*beat+end);
	setTimeout(frame21,10*beat);
	setTimeout(frame22,10*beat+end);
	setTimeout(frame23,11*beat);
	setTimeout(frame24,11*beat+end);
	setTimeout(frame25,12*beat);
	setTimeout(frame26,12*beat+end);
	setTimeout(frame27,13*beat);
	setTimeout(frame28,13*beat+end);
	setTimeout(frame29,14*beat);
	setTimeout(frame30,14*beat+end);
	setTimeout(frame31,15*beat);
	setTimeout(frame32,15*beat+end);
	
	function frame1(){X1.style.backgroundColor = "black";}
	function frame2(){X1.style.backgroundColor = "white";}
	function frame3(){X2.style.backgroundColor = "black";}
	function frame4(){X2.style.backgroundColor = "white";}
	function frame5(){X3.style.backgroundColor = "black";}
	function frame6(){X3.style.backgroundColor = "white";}
	function frame7(){X4.style.backgroundColor = "black";}
	function frame8(){X4.style.backgroundColor = "white";}
	function frame9(){X5.style.backgroundColor = "black";}
	function frame10(){X5.style.backgroundColor = "white";}
	function frame11(){X6.style.backgroundColor = "black";}
	function frame12(){X6.style.backgroundColor = "white";}
	function frame13(){X7.style.backgroundColor = "black";}
	function frame14(){X7.style.backgroundColor = "white";}
	function frame15(){X8.style.backgroundColor = "black";}
	function frame16(){X8.style.backgroundColor = "white";}
	function frame17(){X9.style.backgroundColor = "black";}
	function frame18(){X9.style.backgroundColor = "white";}
	function frame19(){X10.style.backgroundColor = "black";}
	function frame20(){X10.style.backgroundColor = "white";}
	function frame21(){X11.style.backgroundColor = "black";}
	function frame22(){X11.style.backgroundColor = "white";}
	function frame23(){X12.style.backgroundColor = "black";}
	function frame24(){X12.style.backgroundColor = "white";}
	function frame25(){X13.style.backgroundColor = "black";}
	function frame26(){X13.style.backgroundColor = "white";}
	function frame27(){X14.style.backgroundColor = "black";}
	function frame28(){X14.style.backgroundColor = "white";}
	function frame29(){X15.style.backgroundColor = "black";}
	function frame30(){X15.style.backgroundColor = "white";}
	function frame31(){X16.style.backgroundColor = "black";}
	function frame32(){X16.style.backgroundColor = "white";}
	}

//VARIABLES--------------------------------------------------------	
function variables(){
	
	var Chord1 = document.getElementById("Chord1");
	var Chord2 = document.getElementById("Chord2");
	var Chord3 = document.getElementById("Chord3");
	var Chord4 = document.getElementById("Chord4");
	
	var B1 = document.getElementById("B1");
	var B2 = document.getElementById("B2");
	var B3 = document.getElementById("B3");
	var B4 = document.getElementById("B4");
	var B5 = document.getElementById("B5");
	var B6 = document.getElementById("B6");
	var B7 = document.getElementById("B7");
	var B8 = document.getElementById("B8");
	var B9 = document.getElementById("B9");
	var B10 = document.getElementById("B10");
	var B11 = document.getElementById("B11");
	var B12 = document.getElementById("B12");
	var B13 = document.getElementById("B13");
	var B14 = document.getElementById("B14");
	var B15 = document.getElementById("B15");
	var B16 = document.getElementById("B16");

	var D1 = document.getElementById("D1");
	var D2 = document.getElementById("D2");
	var D3 = document.getElementById("D3");
	var D4 = document.getElementById("D4");
	var D5 = document.getElementById("D5");
	var D6 = document.getElementById("D6");
	var D7 = document.getElementById("D7");
	var D8 = document.getElementById("D8");
	var D9 = document.getElementById("D9");
	var D10 = document.getElementById("D10");
	var D11 = document.getElementById("D11");
	var D12 = document.getElementById("D12");
	var D13 = document.getElementById("D13");
	var D14 = document.getElementById("D14");
	var D15 = document.getElementById("D15");
	var D16 = document.getElementById("D16");

	var E1 = document.getElementById("E1");
	var E2 = document.getElementById("E2");
	var E3 = document.getElementById("E3");
	var E4 = document.getElementById("E4");
	var E5 = document.getElementById("E5");
	var E6 = document.getElementById("E6");
	var E7 = document.getElementById("E7");
	var E8 = document.getElementById("E8");
	var E9 = document.getElementById("E9");
	var E10 = document.getElementById("E10");
	var E11 = document.getElementById("E11");
	var E12 = document.getElementById("E12");
	var E13 = document.getElementById("E13");
	var E14 = document.getElementById("E14");
	var E15 = document.getElementById("E15");
	var E16 = document.getElementById("E16");
	
	var F1 = document.getElementById("F1");
	var F2 = document.getElementById("F2");
	var F3 = document.getElementById("F3");
	var F4 = document.getElementById("F4");
	var F5 = document.getElementById("F5");
	var F6 = document.getElementById("F6");
	var F7 = document.getElementById("F7");
	var F8 = document.getElementById("F8");
	var F9 = document.getElementById("F9");
	var F10 = document.getElementById("F10");
	var F11 = document.getElementById("F11");
	var F12 = document.getElementById("F12");
	var F13 = document.getElementById("F13");
	var F14 = document.getElementById("F14");
	var F15 = document.getElementById("F15");
	var F16 = document.getElementById("F16");
	
	var G1 = document.getElementById("G1");
	var G2 = document.getElementById("G2");
	var G3 = document.getElementById("G3");
	var G4 = document.getElementById("G4");
	var G5 = document.getElementById("G5");
	var G6 = document.getElementById("G6");
	var G7 = document.getElementById("G7");
	var G8 = document.getElementById("G8");
	var G9 = document.getElementById("G9");
	var G10 = document.getElementById("G10");
	var G11 = document.getElementById("G11");
	var G12 = document.getElementById("G12");
	var G13 = document.getElementById("G13");
	var G14 = document.getElementById("G14");
	var G15 = document.getElementById("G15");
	var G16 = document.getElementById("G16");
	
	var X1 = document.getElementById("X1");
	var X2 = document.getElementById("X2");
	var X3 = document.getElementById("X3");
	var X4 = document.getElementById("X4");
	var X5 = document.getElementById("X5");
	var X6 = document.getElementById("X6");
	var X7 = document.getElementById("X7");
	var X8 = document.getElementById("X8");
	var X9 = document.getElementById("X9");
	var X10 = document.getElementById("X10");
	var X11 = document.getElementById("X11");
	var X12 = document.getElementById("X12");
	var X13 = document.getElementById("X13");
	var X14 = document.getElementById("X14");
	var X15 = document.getElementById("X15");
	var X16 = document.getElementById("X16");
}
