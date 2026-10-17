.class public final synthetic Lxw1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/util/concurrent/Callable;


# static fields
.field public static final synthetic b:Lxw1;

.field public static final synthetic c:Lxw1;


# instance fields
.field public final synthetic a:I


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lxw1;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lxw1;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lxw1;->b:Lxw1;

    .line 8
    .line 9
    new-instance v0, Lxw1;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-direct {v0, v1}, Lxw1;-><init>(I)V

    .line 13
    .line 14
    .line 15
    sput-object v0, Lxw1;->c:Lxw1;

    .line 16
    .line 17
    return-void
.end method

.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, Lxw1;->a:I

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget p0, p0, Lxw1;->a:I

    .line 2
    .line 3
    packed-switch p0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    return-object p0

    .line 8
    :pswitch_0
    new-instance p0, Lo72;

    .line 9
    .line 10
    const-string v0, "internal.platform"

    .line 11
    .line 12
    const/4 v1, 0x4

    .line 13
    invoke-direct {p0, v0, v1}, Lo72;-><init>(Ljava/lang/String;I)V

    .line 14
    .line 15
    .line 16
    new-instance v0, Lo72;

    .line 17
    .line 18
    const/4 v1, 0x3

    .line 19
    const-string v2, "getVersion"

    .line 20
    .line 21
    invoke-direct {v0, v2, v1}, Lo72;-><init>(Ljava/lang/String;I)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Lms1;->k:Ljava/util/HashMap;

    .line 25
    .line 26
    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    return-object p0

    .line 30
    nop

    .line 31
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
