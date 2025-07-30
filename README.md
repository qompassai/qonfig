<!------------ /qompassai/qonfig/README.md---------------->
<!------------------- Qompass AI Qonfig ------------------>
<!-- Copyright (C) 2025 Qompass AI, All rights reserved -->
<!-------------------------------------------------------->

<h2> Qompass AI Qonfig </h3>

  <h3> Qompass AI Qonfig: A Quality Dotfile Manager </h3>

<p align="center">
![Repository Views](https://komarev.com/ghpvc/?username=qompassai-qonfig)
![GitHub all releases](https://img.shields.io/github/downloads/qompassai/qonfig/total?style=flat-square)

  <a href="https://wiki.archlinux.org/title/XDG_Base_Directory">
    <img src="https://img.shields.io/badge/XDG/Dotfiles-1793D1?style=for-the-badge&logo=linux&logoColor=white"
      alt="XDG and Dotfiles">
  </a>
  <br>
  <a href="https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html">
    <img src="https://img.shields.io/badge/XDG_Spec-blue?style=flat-square" alt="XDG Specification">
  </a>
  <a href="https://wiki.archlinux.org/title/Dotfiles">
    <img src="https://img.shields.io/badge/Dotfiles_Documentation-blue?style=flat-square" alt="Dotfiles Documentation">
  </a>
  <a href="https://github.com/topics/dotfiles">
    <img src="https://img.shields.io/badge/Dotfiles_Tutorials-green?style=flat-square" alt="Dotfiles Tutorials">
  </a>
  <br>
  <a href="https://www.gnu.org/licenses/agpl-3.0"><img src="https://img.shields.io/badge/License-AGPL%20v3-blue.svg"
      alt="License: AGPL v3"></a>
  <a href="./LICENSE-QCDA"><img src="https://img.shields.io/badge/license-Q--CDA-lightgrey.svg"
      alt="License: Q-CDA"></a>
  </p>

  <details>
    <summary
      style="font-size: 1.4em; font-weight: bold; padding: 15px; background: #667eea; color: white; border-radius: 10px; cursor: pointer; margin: 10px 0;">
      <strong>▶️ Qompass AI Quick Start</strong>
    </summary>
    <div style="background: #f8f9fa; padding: 15px; border-radius: 5px; margin-top: 10px; font-family: monospace;">
      ```bash
      bash <(curl -fsSL https://raw.githubusercontent.com/qompassai/qonfig/main/scripts/quickstart.sh) ``` </div>
        <blockquote
          style="font-size: 1.2em; line-height: 1.8; padding: 25px; background: #f8f9fa; border-left: 6px solid #667eea; border-radius: 8px; margin: 15px 0; box-shadow: 0 2px 8px rgba(0,0,0,0.1);">
          <details>
            <summary
              style="font-size: 1em; font-weight: bold; padding: 10px; background: #e9ecef; color: #333; border-radius: 5px; cursor: pointer; margin: 10px 0;">
              <strong>📄 We advise you read the script BEFORE running it 😉</strong>
            </summary>
            <pre style="background: #fff; padding: 15px; border-radius: 5px; border: 1px solid #ddd; overflow-x: auto;">
#!/usr/bin/env bash
# /qompassai/qonfig/scripts/quickstart.sh
# Qompass AI Qonfig Quickstart
# Copyright (C) 2025 Qompass AI, All rights reserved
####################################################
set -Eeuo pipefail
INSTALL_DIR="${HOME}/.local/bin"
QONFIG_SCRIPT="bin/qonfig"
SCRIPT_NAME="qonfig"
USE_SYMLINK=false
echoerrcolor() {
	if (($colors)); then
		case $1 in
		none)
			str="\e[0;37m"
			;;
		green)
			str="\e[0;32m"
			;;
		red)
			str="\e[0;31m"
			;;
		blue)
			str="\e[1;34m"
			;;
		darkcyan)
			str="\e[0;36m"
			;;
		darkgreen)
			str="\e[1;32m"
			;;
		darkred)
			str="\e[1;31m"
			;;
		magenta)
			str="\e[0;35m"
			;;
		darkmagenta)
			str="\e[1;35m"
			;;
		esac
		echo -ne $str >&2
	fi
}
echoerrnocolor() {
	if (($colors)); then
		echo -ne "\e[0m" >&2
	fi
}
echoerr() {
	if [ $# -gt 1 ]; then
		color=$1
		shift
		echoerrcolor $color
	fi
	echo "$@" >&2
	if [ $color ]; then
		echoerrnocolor
	fi
}
printferr() { printf "$@" >&2; }
$(which git >&/dev/null)
if [ $? -eq 1 ]; then
	echoerr red "Git not found! Confirm it is indeed installed and reachable."
	exit
fi
appendshell() {
	case "$1" in
	start)
		add='echo "Setting up Qonfig. Please do not ^C." >&2;'
		;;
	mkprefix)
		add="mkdir -p $2; cd $2;"
		;;
	gitinit)
		add='git init;'
		;;
	gitaddsub)
		add='git submodule add https://github.com/qompassai/qonfig;'
		;;
	gitignoredirty)
		add='git config -f .gitmodules submodule.qonfig.ignore dirty;'
		;;
	gitinstallinstall)
		add='cp qonfig/tools/git-submodule/install .;'
		;;
	ensureparentdirs)
		add="mkdir -p $2; rmdir $2;"
		;;
	mv)
		add="mv $2 $3;"
		;;
	echoconfig)
		add='echo -e "'$2'" >> '$3';'
		;;
	runinstaller)
		add='./install;'
		;;
	gitsetname)
		if (($3)); then
			global=' --global '
		else
			global=' '
		fi
		add='git config'$global'user.name "'$2'";'
		;;
	gitsetemail)
		if (($3)); then
			global=' --global '
		else
			global=' '
		fi
		add='git config'$global'user.email "'$2'";'
		;;
	gitinitialcommit)
		add='git add -A; git commit -m "Initial commit";'
		;;
	esac
	setupshell=$setupshell' '$add
}
testmode=0
verboseconf=0
dumpconf=0
preview=1
colors=0
while [ $# -ne 0 ]; do
	case "$1" in
	test)
		testmode=1
		echoerr darkcyan "Test mode enabled."
		;;
	no-test)
		testmode=0
		echoerr darkcyan "Test mode disabled."
		;;
	verbose-config)
		verboseconf=1
		echoerr darkcyan "Verbose configuration file active."
		;;
	no-verbose-config)
		verboseconf=0
		echoerr darkcyan "Concise configuration file active."
		;;
	dump-config)
		dumpconf=1
		echoerr darkcyan "Will dump config to stdout."
		;;
	no-dump-config)
		dumpconf=0
		echoerr darkcyan "Will not dump config to stdout."
		;;
	preview)
		preview=1
		echoerr darkcyan "Will show commands to be executed."
		;;
	no-preview)
		preview=0
		echoerr darkcyan "Will not show commands to be executed."
		;;
	colors)
		colors=1
		echoerr darkcyan "Will print with colors."
		;;
	no-colors)
		colors=0
		echoerr darkcyan "No color."
		;;
	*)
		echoerr red "Unfamiliar configuration option"
		;;
	esac
	shift
done
paths=(
	"$HOME/.Xdefaults"
	"$HOME/.Xmodmap"
	"$HOME/.Xresources"
	"$HOME/.bash_aliases"
	"$HOME/.bash_logout"
	"$HOME/.bash_profile"
	"$HOME/.bashrc"
	"$HOME/.conkyrc"
	"$HOME/.gitconfig"
	"$HOME/.i3"
	"$HOME/.i3status.conf"
	"$HOME/.profile"
	"$HOME/.ssh/config"
	"$HOME/.tmux.conf"
	"$HOME/.vimperatorrc"
	"$HOME/.vimrc"
	"$HOME/.vim/vimrc"
	"$HOME/.xinitrc"
	"$HOME/bin"
	"${XDG_CONFIG_HOME:-$HOME/.config}/awesome"
	"${XDG_CONFIG_HOME:-$HOME/.config}/dmenu"
	"${XDG_CONFIG_HOME:-$HOME/.config}/i3"
	"${XDG_CONFIG_HOME:-$HOME/.config}/obmenu-generator"
	"${XDG_CONFIG_HOME:-$HOME/.config}/openbox"
	"${XDG_CONFIG_HOME:-$HOME/.config}/pianobar"
	"${XDG_CONFIG_HOME:-$HOME/.config}/redshift"
	"${XDG_CONFIG_HOME:-$HOME/.config}/tint2"
	"${XDG_CONFIG_HOME:-$HOME/.config}/vimprobable"
	"$HOME/.zprofile"
	"$HOME/.zshenv"
	"$HOME/.zshrc"
)
setupshell=''
dotclean=''
dotlink=''
dotshell=''
installerrun=1
echoerr blue "Welcome to the Qonfig generator"
echoerr blue "Please be aware that if you have a complicated setup, you may need more customization than this script offers."
echoerr
echoerr blue "At any time, press ^C to quit. No changes will be made until you confirm."
echoerr
appendshell start
prefix="{$HOME}/.dotfiles"
prefixfull="${prefix/\~/${HOME}}"
if ! [ -d "$prefixfull" ]; then
	echoerr darkcyan "${prefix} is not in use."
else
	echoerr darkcyan "${prefix} exists and may have another purpose than ours."
fi
while true; do
	read -r -p "Where do you want your dotfiles repository to be? ($prefix) " answer
	if [ -z "$answer" ]; then
		break
	else
		echoerr red "FEATURE NOT YET SUPPORTED."
		echoerr red "Sorry for misleading you."
		echoerr
	fi
done
appendshell mkprefix "$prefix"
appendshell gitinit
while true; do
	read -p "Shall we add Qonfig as a submodule (default)? (Y/n) " answer
	if [ -z "$answer" ]; then
		answer='y'
	fi
	case "$answer" in
	Y* | y*)
		echoerr green "Will do."
		appendshell gitaddsub
		appendshell gitignoredirty
		appendshell gitinstallinstall
		break
		;;
	N* | n*)
		echoerr darkgreen "Okay, I shall not. You will need to manually set up your install script."
		installerrun=0
		break
		;;
	*)
		echoerr red "Answer not understood: ${answer}"
		;;
	esac
done
while true; do
	read -p "Do you want Qonfig to clean ~/ of broken links added by Qonfig (recommended) (Y/n) " answer
	if [ -z "$answer" ]; then
		answer='y'
	fi
	case "$answer" in
	Y* | y*)
		echoerr green "I will ask Qonfig to clean."
		dotclean="- clean: ['~']"
		break
		;;
	N* | n*)
		echoerr darkgreen "Not asking Qonfig to clean."
		break
		;;
	*)
		echoerr red "Only Y/y/N/n are accepted as answers, please try again: ${answer}"
		;;
	esac
done
declare -a linksection
declare -i i
for item in ${paths[*]}; do
	fullname="${item/\~/$HOME}"
	if [ -h $fullname ]; then
		continue
	fi
	if [ -f $fullname ] || [ -d $fullname ]; then
		while true; do
			read -p "I found ${item}, do you want to Qonfig it? (Y/n) " answer
			if [ -z "$answer" ]; then
				answer='y'
			fi
			case "$answer" in
			Y* | y*)
				linksection[$i]=$item
				i=$i+1
				echoerr green "Qonfigured!"
				break
				;;
			N* | n*)
				echoerr darkgreen "Not added to Qonfig."
				break
				;;
			*)
				echoerr red "Answer not understood: ${answer}"
				;;
			esac
		done
	fi
done
dotlink='- link:'
newline='\n'
hspace='\x20\x20\x20\x20'
for item in ${linksection[*]}; do
	fullname="${item/\~/$HOME}"
	firstdot=$(echo "$item" | sed -n "s/[.].*//p" | wc -c)
	firstslash=$(echo "$item" | sed -n "s/[/].*//p" | wc -c)
	if [ -d $fullname ]; then
		itempath=$item'/'
	else
		itempath=$item
	fi
	if [[ $firstdot -gt $firstslash ]]; then
		itempath=${itempath:$firstdot}
	else
		itempath=${itempath:$firstslash}
	fi
	nextslash=$(echo "$itempath" | sed -n "s/[/].*//p" | wc -c)
	if [[ $nextslash -gt 0 ]]; then
		entryisdir='true'
	else
		entryisdir='false'
	fi
	if (("$verboseconf")); then
		new_entry=$newline$hspace$item':'
		new_entry=$new_entry$newline$hspace$hspace'path: '$itempath
		new_entry=$new_entry$newline$hspace$hspace'create: '$entryisdir
		new_entry=$new_entry$newline$hspace$hspace'relink: false'
		new_entry=$new_entry$newline$hspace$hspace'force: false'
	elif [[ $entryisdir = 'false' ]]; then
		new_entry=$newline$hspace$item': '$itempath
	else
		new_entry=$newline$hspace$item':'
		new_entry=$new_entry$newline$hspace$hspace'path: '$itempath
		new_entry=$new_entry$newline$hspace$hspace'create: '$entryisdir
	fi
	appendshell ensureparentdirs $itempath
	appendshell mv $item $itempath
	dotlink="$dotlink$new_entry"
done
export qonfigyaml="$dotclean$newline$newline$dotlink$newline$newline$dotshell"
appendshell echoconfig "$qonfigyaml" 'qonfig.yaml'
getgitinfo=0
gitinfoglobal=0
if (("$installerrun")); then
	$(git config user.name >&/dev/null && git config user.email >&/dev/null)
	if [ $? -ne 0 ]; then
		echoerr darkred "Please note you do not have a name or email set for git."
		echoerr darkred "I shall not be able to commit unless you set the missing variables."
		while [ 1 ]; do
			read -p "Do you want to set them? (Y/n) " answer
			if [ -z "$answer" ]; then
				answer='y'
			fi
			case "$answer" in
			Y* | y*)
				getgitinfo=1
				break
				;;
			N* | n*)
				echoerr darkgreen "Okay, I shall not."
				getgitinfo=0
				installerrun=0
				break
				;;
			*)
				echoerr red "Answer not understood: ${answer}"
				;;
			esac
		done
		while [ 1 ]; do
			read -p "Do you want these settings to be global? (Y/n) " answer
			if [ -z "$answer" ]; then
				answer='y'
			fi
			case "$answer" in
			Y* | y*)
				echoerr green "Adding --global to the set commands."
				gitinfoglobal=1
				break
				;;
			N* | n*)
				echoerr green "Okay, I shall make them local."
				gitinfoglobal=0
				break
				;;
			*)
				echoerr red "Answer not understood: ${answer}"
				;;
			esac
		done
	fi
fi
if (("$getgitinfo")); then
	$(git config user.name >&/dev/null)
	if [ $? -ne 0 ]; then
		gitname="FirstName LastName"
	else
		gitname="$(git config user.name)"
	fi
	$(git config user.email >&/dev/null)
	if [ $? -ne 0 ]; then
		gitemail="FirstName.LastName@example.com"
	else
		gitemail="$(git config user.email)"
	fi
	read -p "What do you want for your git name? [${gitname}]" answer
	if [ -z "$answer" ]; then
		answer="$gitname"
	fi
	gitname="$answer"
	read -p "What do you want for your git email? [${gitemail}]" answer
	if [ -z "$answer" ]; then
		answer="$gitemail"
	fi
	gitemail="$answer"
	appendshell gitsetname "$gitname" $gitinfoglobal
	appendshell gitsetemail "$gitemail" $gitinfoglobal
fi
while (($installerrun)); do
	read -p "Shall I run the installer? (Necessary to git commit) (Y/n) " answer
	if [ -z "$answer" ]; then
		answer='y'
	fi
	case "$answer" in
	Y* | y*)
		echoerr green "Will do."
		appendshell runinstaller
		break
		;;
	N* | n*)
		echoerr darkgreen "Okay, I shall not. You will need to take care of that yourself."
		installerrun=0
		break
		;;
	*)
		echoerr red "Answer not understood: ${answer}"
		;;
	esac
done
while (($installerrun)); do
	read -p "Shall I make the initial commit? (Y/n) " answer
	if [ -z "$answer" ]; then
		answer='y'
	fi
	case "$answer" in
	Y* | y*)
		echoerr green "Will do."
		appendshell gitinitialcommit
		break
		;;
	N* | n*)
		echoerr darkgreen "Okay, I shall not. You will need to take care of that yourself."
		break
		;;
	*)
		echoerr red "Answer not understood: ${answer}"
		;;
	esac
done
echoerr
if (($dumpconf)); then
	echo -e "$dotlink"
	echoerr
fi
echoerr magenta "The below are the actions that will be taken to setup Qonfig."
if (($testmode)); then
	echoerr darkmagenta "Just kidding. They won't be."
fi
if (($preview)); then
	printferr "\n${setupshell//; /;\\n}\n\n" # place newline after each command for printing
	warningmessage='If you do not see a problem with the above commands, press enter. '
else
	warningmessage=''
fi
echoerrcolor darkred
read -p "${warningmessage}This is your last chance to press ^C before actions are taken that should not be interrupted. "
echoerrnocolor
if ! (($testmode)); then
	eval $setupshell
fi
function info() {
	printf "\033[1;32m[info]\033[0m %s\n" "$*"
}
function error() {
	printf "\033[1;31m[error]\033[0m %s\n" "$*" >&2
	exit 1
}
function check_dependencies() {
	command -v python3 >/dev/null || error "python3 is required"
}
function find_repo_root() {
	git rev-parse --show-toplevel 2>/dev/null || pwd
}
function install_qonfig() {
	REPO_ROOT=$(find_repo_root)
	QONFIG_SRC="${REPO_ROOT}/${QONFIG_SCRIPT}"
	[[ -f "${QONFIG_SRC}" ]] || error "Missing Qonfig at ${QONFIG_SRC}"
	mkdir -p "${INSTALL_DIR}"
	local target="${INSTALL_DIR}/${SCRIPT_NAME}"
	if $USE_SYMLINK; then
		ln -sf "${QONFIG_SRC}" "${target}"
		info "Symlinked qonfig → ${target}"
	else
		cp "${QONFIG_SRC}" "${target}"
		chmod +x "${target}"
		info "Copied Qonfig to ${target}"
	fi
	info "Qonfig installed to ${target}"
}
function main() {
	check_dependencies
	install_qonfig
}
main "$@" </pre> </details> <p>Or, <a href="https://github.com/qompassai/qonfig/blob/main/scripts/quickstart.sh" target="_blank">View
the quickstart script</a>.</p>

 </details>

  </blockquote>
  </details>

<details>
    <summary
      style="font-size: 1.4em; font-weight: bold; padding: 15px; background: #667eea; color: white; border-radius: 10px; cursor: pointer; margin: 10px 0;">
      <strong>📖 [Read the Qonfig documentation](qonfig/docs/README.md)</strong>
    </summary>
</details>

  <details>
    <summary
      style="font-size: 1.4em; font-weight: bold; padding: 15px; background: #667eea; color: white; border-radius: 10px; cursor: pointer; margin: 10px 0;">
      <strong>🧭 About Qompass AI</strong>
    </summary>
    <blockquote
      style="font-size: 1.2em; line-height: 1.8; padding: 25px; background: #f8f9fa; border-left: 6px solid #667eea; border-radius: 8px; margin: 15px 0; box-shadow: 0 2px 8px rgba(0,0,0,0.1);">
    <div align="center">
    <p>Matthew A. Porter<br>
      Former Intelligence Officer<br>
      Educator & Learner<br>
      DeepTech Founder & CEO</p>
  </div>

  <h3>Publications</h3>
  <p>
    <a href="https://orcid.org/0000-0002-0302-4812">
      <img src="https://img.shields.io/badge/ORCID-0000--0002--0302--4812-green?style=flat-square&logo=orcid"
        alt="ORCID">
    </a>
    <a href="https://www.researchgate.net/profile/Matt-Porter-7">
      <img src="https://img.shields.io/badge/ResearchGate-Open--Research-blue?style=flat-square&logo=researchgate"
        alt="ResearchGate">
    </a>
    <a href="https://zenodo.org/communities/qompassai">
      <img src="https://img.shields.io/badge/Zenodo-Publications-blue?style=flat-square&logo=zenodo" alt="Zenodo">
    </a>
  </p>

  <h3>Developer Programs</h3>

[![NVIDIA
Developer](https://img.shields.io/badge/NVIDIA-Developer_Program-76B900?style=for-the-badge\&logo=nvidia\&logoColor=white)](https://developer.nvidia.com/)
[![Meta
Developer](https://img.shields.io/badge/Meta-Developer_Program-0668E1?style=for-the-badge\&logo=meta\&logoColor=white)](https://developers.facebook.com/)
[![HackerOne](https://img.shields.io/badge/-HackerOne-%23494649?style=for-the-badge\&logo=hackerone\&logoColor=white)](https://hackerone.com/phaedrusflow)
[![HuggingFace](https://img.shields.io/badge/HuggingFace-qompass-yellow?style=flat-square\&logo=huggingface)](https://huggingface.co/qompass)
[![Epic Games
Developer](https://img.shields.io/badge/Epic_Games-Developer_Program-313131?style=for-the-badge\&logo=epic-games\&logoColor=white)](https://dev.epicgames.com/)

  <h3>Professional Profiles</h3>
  <p>
    <a href="https://www.linkedin.com/in/matt-a-porter-103535224/">
      <img src="https://img.shields.io/badge/LinkedIn-Matt--Porter-blue?style=flat-square&logo=linkedin"
        alt="Personal LinkedIn">
    </a>
    <a href="https://www.linkedin.com/company/95058568/">
      <img src="https://img.shields.io/badge/LinkedIn-Qompass--AI-blue?style=flat-square&logo=linkedin"
        alt="Startup LinkedIn">
    </a>
  </p>

  <h3>Social Media</h3>
  <p>
    <a href="https://twitter.com/PhaedrusFlow">
      <img src="https://img.shields.io/badge/Twitter-@PhaedrusFlow-blue?style=flat-square&logo=twitter"
        alt="X/Twitter">
    </a>
    <a href="https://www.instagram.com/phaedrusflow">
      <img src="https://img.shields.io/badge/Instagram-phaedrusflow-purple?style=flat-square&logo=instagram"
        alt="Instagram">
    </a>
    <a href="https://www.youtube.com/@qompassai">
      <img src="https://img.shields.io/badge/YouTube-QompassAI-red?style=flat-square&logo=youtube"
        alt="Qompass AI YouTube">
    </a>
  </p>

</blockquote>

  </details>

  <details>
    <summary
      style="font-size: 1.4em; font-weight: bold; padding: 15px; background: #ff6b6b; color: white; border-radius: 10px; cursor: pointer; margin: 10px 0;">
      <strong>🔥 How Do I Support</strong>
    </summary>
    <blockquote
      style="font-size: 1.2em; line-height: 1.8; padding: 25px; background: #fff5f5; border-left: 6px solid #ff6b6b; border-radius: 8px; margin: 15px 0; box-shadow: 0 2px 8px rgba(0,0,0,0.1);">
  <div align="center">
    <table>
      <tr>
        <th align="center">🏛️ Qompass AI Pre-Seed Funding 2023-2025</th>
        <th align="center">🏆 Amount</th>
        <th align="center">📅 Date</th>
      </tr>
      <tr>
        <td><a href="https://github.com/qompassai/r4r"
            title="RJOS/Zimmer Biomet Research Grant Repository">RJOS/Zimmer Biomet Research Grant</a></td>
        <td align="center">$30,000</td>
        <td align="center">March 2024</td>
      </tr>
      <tr>
        <td><a href="https://github.com/qompassai/PathFinders" title="GitHub Repository">Pathfinders Intern
            Program</a><br>
          <small><a
              href="https://www.linkedin.com/posts/evergreenbio_bioscience-internships-workforcedevelopment-activity-7253166461416812544-uWUM/"
              target="_blank">View on LinkedIn</a></small>
        </td>
        <td align="center">$2,000</td>
        <td align="center">October 2024</td>
      </tr>
    </table>
    <br>
    <h4>🤝 How To Support Our Mission</h4>
    [![GitHub
    Sponsors](https://img.shields.io/badge/GitHub-Sponsor-EA4AAA?style=for-the-badge\&logo=github-sponsors\&logoColor=white)](https://github.com/sponsors/phaedrusflow)
    [![Patreon](https://img.shields.io/badge/Patreon-Support-F96854?style=for-the-badge\&logo=patreon\&logoColor=white)](https://patreon.com/qompassai)
    [![Liberapay](https://img.shields.io/badge/Liberapay-Donate-F6C915?style=for-the-badge\&logo=liberapay\&logoColor=black)](https://liberapay.com/qompassai)
    [![Open
    Collective](https://img.shields.io/badge/Open%20Collective-Support-7FADF2?style=for-the-badge\&logo=opencollective\&logoColor=white)](https://opencollective.com/qompassai)
    [![Buy Me A
    Coffee](https://img.shields.io/badge/Buy%20Me%20A%20Coffee-Support-FFDD00?style=for-the-badge\&logo=buy-me-a-coffee\&logoColor=black)](https://www.buymeacoffee.com/phaedrusflow)
    <details markdown="1">
      <summary><strong>🔐 Cryptocurrency Donations</strong></summary>
      **Monero (XMR):**
      <div align="center">
        <img src="https://github.com/qompassai/svg/assets/monero-qr.svg" alt="Monero QR Code" width="180">
      </div>
  <div style="margin: 10px 0;">
    <code>42HGspSFJQ4MjM5ZusAiKZj9JZWhfNgVraKb1eGCsHoC6QJqpo2ERCBZDhhKfByVjECernQ6KeZwFcnq8hVwTTnD8v4PzyH</code>
  </div>

<button
onclick="navigator.clipboard.writeText('42HGspSFJQ4MjM5ZusAiKZj9JZWhfNgVraKb1eGCsHoC6QJqpo2ERCBZDhhKfByVjECernQ6KeZwFcnq8hVwTTnD8v4PzyH')"
style="padding: 6px 12px; background: #FF6600; color: white; border: none; border-radius: 4px; cursor: pointer;">
📋 Copy Address </button>

  <p><i>Funding helps us continue our research at the intersection of AI, healthcare, and education</i></p>

</blockquote>

  </details>
  </details>

  <details id="FAQ">
    <summary><strong>Frequently Asked Questions</strong></summary>
### Q: How do you mitigate against bias?

**TLDR - we do math to make AI ethically useful**

### A: We delineate between mathematical bias (MB) - a fundamental parameter in neural network equations - and

algorithmic/social bias (ASB). While MB is optimized during model training through backpropagation, ASB requires
careful consideration of data sources, model architecture, and deployment strategies. We implement attention
mechanisms for improved input processing and use legal open-source data and secure web-search APIs to help mitigate
ASB.

[AAMC AI Guidelines | One way to align AI against
ASB](https://www.aamc.org/about-us/mission-areas/medical-education/principles-ai-use)

### AI Math at a glance

## Forward Propagation Algorithm

$$
y = w\_1x\_1 + w\_2x\_2 + ... + w\_nx\_n + b
$$

Where:

* $y$ represents the model output
* $(x\_1, x\_2, ..., x\_n)$ are input features
* $(w\_1, w\_2, ..., w\_n)$ are feature weights
* $b$ is the bias term

### Neural Network Activation

For neural networks, the bias term is incorporated before activation:

$$
z = \sum\_{i=1}^{n} w\_ix\_i + b
$$
$$
a = \sigma(z)
$$

Where:

* $z$ is the weighted sum plus bias
* $a$ is the activation output
* $\sigma$ is the activation function

### Attention Mechanism- aka what makes the Transformer (The "T" in ChatGPT) powerful

* [Attention High level overview video](https://www.youtube.com/watch?v=fjJOgb-E41w)

* [Attention Is All You Need Arxiv Paper](https://arxiv.org/abs/1706.03762)

The Attention mechanism equation is:

$$
\text{Attention}(Q, K, V) = \text{softmax}\left( \frac{QK^T}{\sqrt{d\_k}} \right) V
$$

Where:

* $Q$ represents the Query matrix
* $K$ represents the Key matrix
* $V$ represents the Value matrix
* $d\_k$ is the dimension of the key vectors
* $\text{softmax}(\cdot)$ normalizes scores to sum to 1

### Q: Do I have to buy a Linux computer to use this? I don't have time for that!

### A: No. You can run Linux and/or the tools we share alongside your existing operating system:

* Windows users can use Windows Subsystem for Linux [WSL](https://learn.microsoft.com/en-us/windows/wsl/install)
* Mac users can use [Homebrew](https://brew.sh/)
* The code-base instructions were developed with both beginners and advanced users in mind.

### Q: Do you have to get a masters in AI?

### A: Not if you don't want to. To get competent enough to get past ChatGPT dependence at least, you just need a

computer and a beginning's mindset. Huggingface is a good place to start.

* [Huggingface](https://docs.google.com/presentation/d/1IkzESdOwdmwvPxIELYJi8--K3EZ98_cL6c5ZcLKSyVg/edit#slide=id.p)

### Q: What makes a "small" AI model?

### A: AI models ~=10 billion(10B) parameters and below. For comparison, OpenAI's GPT4o contains approximately 200B parameters.

  </details>

  <details id="Dual-License Notice">
    <summary><strong>What a Dual-License Means</strong></summary>

### Protection for Vulnerable Populations

The dual licensing aims to address the cybersecurity gap that disproportionately affects underserved populations. As
highlighted by recent attacks<sup><a href="#ref1">\[1]</a></sup>, low-income residents, seniors, and foreign language
speakers face higher-than-average risks of being victims of cyberattacks. By offering both open-source and
commercial licensing options, we encourage the development of cybersecurity solutions that can reach these
vulnerable groups while also enabling sustainable development and support.

### Preventing Malicious Use

The AGPL-3.0 license ensures that any modifications to the software remain open source, preventing bad actors from
creating closed-source variants that could be used for exploitation. This is especially crucial given the rising
threats to vulnerable communities, including children in educational settings. The attack on Minneapolis Public
Schools, which resulted in the leak of 300,000 files and a $1 million ransom demand, highlights the importance of
transparency and security<sup><a href="#ref8">\[8]</a></sup>.

### Addressing Cybersecurity in Critical Sectors

The commercial license option allows for tailored solutions in critical sectors such as healthcare, which has seen
significant impacts from cyberattacks. For example, the recent Change Healthcare attack<sup><a
href="#ref4">\[4]</a></sup> affected millions of Americans and caused widespread disruption for hospitals and
other providers. In January 2025, CISA<sup><a href="#ref2">\[2]</a></sup> and FDA<sup><a href="#ref3">\[3]</a></sup>
jointly warned of critical backdoor vulnerabilities in Contec CMS8000 patient monitors, revealing how medical
devices could be compromised for unauthorized remote access and patient data manipulation.

### Supporting Cybersecurity Awareness

The dual licensing model supports initiatives like the Cybersecurity and Infrastructure Security Agency (CISA)
efforts to improve cybersecurity awareness<sup><a href="#ref7">\[7]</a></sup> in "target rich" sectors, including
K-12 education<sup><a href="#ref5">\[5]</a></sup>. By allowing both open-source and commercial use, we aim to
facilitate the development of tools that support these critical awareness and protection efforts.

### Bridging the Digital Divide

The unfortunate reality is that too many individuals and organizations have gone into a frenzy in every facet of our
daily lives<sup><a href="#ref6">\[6]</a></sup>. These unfortunate folks identify themselves with their talk of "10X"
returns and building towards Artificial General Intelligence aka "AGI" while offering GPT wrappers. Our dual
licensing approach aims to acknowledge this deeply concerning predatory paradigm with clear eyes while still
operating to bring the best parts of the open-source community with our services and solutions.

### Recent Cybersecurity Attacks

Recent attacks underscore the importance of robust cybersecurity measures:

* The Change Healthcare cyberattack in February 2024 affected millions of Americans and caused significant
  disruption to healthcare providers.
* The White House and Congress jointly designated October 2024 as Cybersecurity Awareness Month. This designation
  comes with over 100 actions that align the Federal government and public/private sector partners are taking to help
  every man, woman, and child to safely navigate the age of AI.

By offering both open source and commercial licensing options, we strive to create a balance that promotes
innovation and accessibility. We address the complex cybersecurity challenges faced by vulnerable populations and
critical infrastructure sectors as the foundation of our solutions, not an afterthought.

### References

<div id="footnotes">
  <p id="ref1"><strong>[1]</strong> <a
      href="https://www.whitehouse.gov/briefing-room/statements-releases/2024/10/02/international-counter-ransomware-initiative-2024-joint-statement/">International
      Counter Ransomware Initiative 2024 Joint Statement</a></p>

  <p id="ref2"><strong>[2]</strong> <a
      href="https://www.cisa.gov/sites/default/files/2025-01/fact-sheet-contec-cms8000-contains-a-backdoor-508c.pdf">Contec
      CMS8000 Contains a Backdoor</a></p>

  <p id="ref3"><strong>[3]</strong> <a
      href="https://www.aha.org/news/headline/2025-01-31-cisa-fda-warn-vulnerabilities-contec-patient-monitors">CISA,
      FDA warn of vulnerabilities in Contec patient monitors</a></p>

  <p id="ref4"><strong>[4]</strong> <a
      href="https://www.chiefhealthcareexecutive.com/view/the-top-10-health-data-breaches-of-the-first-half-of-2024">The
      Top 10 Health Data Breaches of the First Half of 2024</a></p>

  <p id="ref5"><strong>[5]</strong> <a href="https://www.cisa.gov/K12Cybersecurity">CISA's K-12 Cybersecurity
      Initiatives</a></p>

  <p id="ref6"><strong>[6]</strong> <a
      href="https://www.ftc.gov/business-guidance/blog/2024/09/operation-ai-comply-continuing-crackdown-overpromises-ai-related-lies">Federal
      Trade Commission Operation AI Comply: continuing the crackdown on overpromises and AI-related lies</a></p>

  <p id="ref7"><strong>[7]</strong> <a
      href="https://www.whitehouse.gov/briefing-room/presidential-actions/2024/09/30/a-proclamation-on-cybersecurity-awareness-month-2024/">A
      Proclamation on Cybersecurity Awareness Month, 2024</a></p>

  <p id="ref8"><strong>[8]</strong> <a
      href="https://therecord.media/minneapolis-schools-say-data-breach-affected-100000/">Minneapolis school
      district says data breach affected more than 100,000 people</a></p>
</div>
  </details>
