.class public abstract Lmb1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final a:Lq10;

.field public static final b:Lsx;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lq10;

    .line 2
    .line 3
    invoke-direct {v0}, Lq10;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lmb1;->a:Lq10;

    .line 7
    .line 8
    new-instance v0, Lsx;

    .line 9
    .line 10
    const/4 v1, 0x3

    .line 11
    invoke-direct {v0, v1}, Lsx;-><init>(I)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lmb1;->b:Lsx;

    .line 15
    .line 16
    return-void
.end method
