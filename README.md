# RobotFramework

## What you need?
## Homebrew

1. Install [Homebrew](https://brew.sh/) in Terminal using the following command

```$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"```

2. Follow the instructions until Homebrew installing success

## Chromedriver

Install [Chromedriver](https://chromedriver.chromium.org/) using brew in Terminal using the following command

```$ brew install chromedriver --cask```

## Python

1. Install Python using brew in Terminal using the following command
```$ brew install python```
2. Follow the instructions until python installating success

## Setup Python Path

1. Create and open your .bash_profile or .zshrc from Terminal
```
$ cd
$ touch .bash_profile
$ open -e .bash_profile
```
2. Set the python PATH in .bash_profile file

3. Save and exit your bash_profile

## Pip

1. Install [Pip](https://pypi.org/project/pip/) using *easy_install* command

```
$ sudo easy_install pip
$ sudo pip install --upgrade pip
```
2. Follow the instructions until pip installing success

# Running the project

1. Clone the project

```git clone https://github.com/apeksha199/RobotFramework.git```

2. Install library dependencies

```pip install -r requirements.txt```

## Run FE automation

```robot FE_Automation/<filename>.robot```

## Run Backend Automation

```robot Backend_Automation/API_Test.robot```

3. Wait until tests executing has finished

4. See the output of tests result in the result folder then open **log.html** or **report.html** using your browser




