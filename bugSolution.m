The solution focuses on consistently removing observers in `MyObject`'s `dealloc` method and anywhere else the observer is no longer needed.

```objectivec
@interface MyObserver : NSObject
@end

@implementation MyObserver
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    // ... observation logic ...
}
@end

@interface MyObject : NSObject
@property (nonatomic, strong) NSString *someProperty;
@end

@implementation MyObject
- (instancetype)init {
    self = [super init];
    if (self) {
        MyObserver *observer = [[MyObserver alloc] init];
        [self addObserver:observer forKeyPath:@