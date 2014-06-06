
#import "AddCompilationActionRow.h"
#import "ActionList.h"
#import "LiveReload-Swift-x.h"
#import "ATFunctionalStyle.h"

@implementation AddCompilationActionRow

- (void)loadContent {
    [super loadContent];
    [self updateMenu];
}

- (void)updateMenu {
    [super updateMenu];

    NSArray *compilerTypes = [[PluginManager sharedPluginManager].actionTypes filteredArrayUsingBlock:^BOOL(ActionType *actionType) {
        return actionType.kind == ActionKindCompiler;
    }];

    for (ActionType *actionType in compilerTypes) {
        NSMenuItem *item = [self.menu addItemWithTitle:[NSString stringWithFormat:NSLocalizedString(@"%@", nil), actionType.name] action:@selector(addActionClicked:) keyEquivalent:@""];
        item.representedObject = @{@"action": actionType.identifier};
        item.target = self;
    }

    // TODO: remove special treatment of Compass
    {
        NSMenuItem *item = [self.menu addItemWithTitle:@"Compass" action:@selector(addActionClicked:) keyEquivalent:@""];
        item.representedObject = @{@"action": @"compass"};
        item.target = self;
    }
}

@end
