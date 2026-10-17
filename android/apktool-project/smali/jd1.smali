.class public abstract Ljd1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final a:Lkl0;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    sget-object v0, Lvk1;->m:Lnk1;

    .line 2
    .line 3
    sget-object v1, Lvk1;->l:Lvk1;

    .line 4
    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    new-instance v3, Lkl0;

    .line 12
    .line 13
    invoke-direct {v3, v0, v1, v2}, Lkl0;-><init>(Lvk1;Lvk1;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    sput-object v3, Ljd1;->a:Lkl0;

    .line 17
    .line 18
    return-void
.end method
