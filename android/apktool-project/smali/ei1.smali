.class public final Lei1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final d:Lnt0;


# instance fields
.field public a:I

.field public b:Ltw0;

.field public c:Ltw0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lnt0;

    .line 2
    .line 3
    const/16 v1, 0x14

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lnt0;-><init>(I)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lei1;->d:Lnt0;

    .line 9
    .line 10
    return-void
.end method

.method public static a()Lei1;
    .locals 1

    .line 1
    sget-object v0, Lei1;->d:Lnt0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lnt0;->a()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lei1;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Lei1;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-object v0
.end method
