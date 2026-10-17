.class public abstract Lkj1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final a:Lmd1;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lmd1;

    .line 2
    .line 3
    sget-object v1, Llj1;->a:Lmj1;

    .line 4
    .line 5
    invoke-interface {v1}, Lmj1;->getWebkitToCompatConverter()Lorg/chromium/support_lib_boundary/WebkitToCompatConverterBoundaryInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v2, 0x2

    .line 10
    invoke-direct {v0, v2, v1}, Lmd1;-><init>(ILjava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lkj1;->a:Lmd1;

    .line 14
    .line 15
    return-void
.end method
