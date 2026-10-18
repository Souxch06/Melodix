.class public final Lo72;
.super Lms1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic l:I


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 1
    iput p2, p0, Lo72;->l:I

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lms1;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Ler0;Ljava/util/List;)Lst1;
    .locals 0

    .line 1
    iget p1, p0, Lo72;->l:I

    .line 2
    .line 3
    sget-object p2, Lst1;->b:Lzt1;

    .line 4
    .line 5
    packed-switch p1, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    return-object p2

    .line 9
    :pswitch_0
    new-instance p0, Lrr1;

    .line 10
    .line 11
    const-wide/16 p1, 0x0

    .line 12
    .line 13
    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-direct {p0, p1}, Lrr1;-><init>(Ljava/lang/Double;)V

    .line 18
    .line 19
    .line 20
    :pswitch_1
    return-object p0

    .line 21
    :pswitch_2
    return-object p2

    .line 22
    nop

    .line 23
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
