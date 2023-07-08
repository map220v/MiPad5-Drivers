

# Windows Driver pack for Xiaomi Pad 5 platform

This repository contains driver binary files for Xiaomi Pad 5.
All driver binary files form a board support package to be used on Xiaomi Pad 5 devices to provide hardware support for the Windows operating system.

These driver files are not perfect, typos may exist, feel free to file an issue on GitHub in case you found any.

These driver files are based on @gus33000 's drivers for Surface Duo. Huge thanks to @gus33000.

## Copyright, License, Disclaimers and end user license agreement

**Below notice must be present in all redistributed portions of this software**

Copyright (c) 2017-2022 WOA-Project

Copyright (c) 2011-2020 Qualcomm Incorporated

Copyright (c) 2019-2022 Microsoft Corporation

This repository contains binary files sourced from Qualcomm Snapdragon 8cx laptops/tablets as well as the Surface Duo original android firmware. As some mistakes may exist, we cannot provide warranty of any kind. 

- By installing this driver pack, you agree that any damage done to your phone or any loss of data is your entire responsibility and we cannot be taken responsible for data loss if it ever happens. We believe however this driver pack is safe to install. Try at your own risk!


The above copyright notice and this permission notice shall be included in all

copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR

IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,

FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE

AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER

LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,

OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE

SOFTWARE.

# Driver Installation

[DriverUpdater](https://github.com/WOA-Project/DriverUpdater/releases/)

```
cd MiPad5-Drivers
.\DriverUpdater.exe -d .\definitions\Desktop\ARM64\Internal\nabu.txt -r ./ -p D:\
```

Change "D:\" to disk where windows arm64 installed