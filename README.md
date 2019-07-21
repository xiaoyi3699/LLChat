重要：LLChat已更改为WZMChatUI，内部文件及资源都已更改，老版的LLChat功能一切正常，但是不会再更新了。
LLChat最后一次更新日期为2019/7/21，此时iOS最新版本为12.3.1。
理论上LLChat在未来很长一段时间内都可正常使用，未集成新版的同学也大可放心。

若还未集成LLChat的同学请前往集成新版。
[点击前往WZMChatUI](https://github.com/wangzhaomeng/WZMChatUI)

新版本优点：
1、采纳某位同学的意见，剔除了.framework，全部替换为开源类；
2、表情资源使用.boundle方式加载，集成更加方便；
3、表情键盘与聊天UI框架完全分离，可单独使用，并且使用抽象类的方式将表情键盘就行了封装，使自定义表情键盘变的非常非常非常的简单；
4、因本人闲暇之余写过一些pod库，未避免与该聊天框架产生文件冲突，特意将该框架剥离出来。

**一、效果图**

![Image text](https://github.com/wangzhaomeng/LLChat/blob/master/LLChat/GitImage/preview.png?raw=true)

**二、手动集成**

**1、设置 Build Setting**

搜索 `other linker flags`

添加 `-ObjC`

**2、如下图所示，将头文件导入`项目pch文件`中，同时`添加图片资源`**

![Image text](https://github.com/wangzhaomeng/LLChat/blob/master/LLChat/GitImage/setting.png?raw=true)

**注：解释一下此处的.framework文件。**
```
这里的.framework是我近年来总结的工具类库，完整、成熟、稳定性强，并且完全使用系统语言，未添加任何第三方。
定义了很多快捷函数，比如：imageView.LLWidth、R_G_B(20, 20, 20)、URLEncode、base64Encode等等；
严格按照驼峰命名法，见词知义，可读性较高；
打包后总体积在1M左右，不必担心增加项目体积；
为了方便集成与移植，特意打包成.framework文件；
聊天的核心代码均为源码，并未参与.framework。
```
**导入.framework文件的注意事项。**
```
1、和LLChat.h一起导入到pch中，全局调用；
2、由于.framework中包含c代码，因此须加入上图所示条件:#ifdef __OBJC__...#endif
```


**三、数据库设计简单描述**

从类型上，可分为3个表：

`用户表(user)、会话表(session)、消息表(message)`；

从实际需求上，再进一步细分：

`用户表需要两个：用户(user)和群(group)；`

`而为了消息的优化处理，每一个私聊或群聊，都可以新建一个消息表(message)`。

```
处理逻辑如下：
1、添加好友 - 发起聊天；
2、查询对应的消息表(message)是否存在，不存在则创建；
3、向该消息表(message)插入私聊消息；
4、从会话表(session)查询对应的会话，不存在则插入，存在则更新；
5、刷新相关页面。
```


**四、表情键盘的处理**

1、自定义layout，实现表情键盘的横向布局；

2、键盘弹出的时机与UITableView的偏移处理；

3、表情字符删除时的匹配处理，以及输入框光标的变化；

4、普通文本转换为表情富文本时的字符偏移，以及正则匹配效率的处理。


**五、消息列表滑动优化**

1、使用model类存储行高、行宽，避免重复计算；

2、视频、图片等消息使用缩略图，减少系统开销；

3、其他常规的优化处理。


