
import os
import sys

def main(file):

	os.system(f"\\masm32\\bin\\ml /c /Zd /coff {file}")
	os.system(f"\\masm32\\bin\\Link /SUBSYSTEM:CONSOLE {file[:-4]}.obj")


if __name__ == '__main__':

	try:
		file = sys.argv[1]
		main(file)
	except IndexError:
		print("You need set one file .ASM x86")
		 
