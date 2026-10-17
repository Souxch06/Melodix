.class public final synthetic Lnb2;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lka;


# instance fields
.field public final synthetic a:Lqb2;

.field public final synthetic b:Lvb2;


# direct methods
.method public synthetic constructor <init>(Lqb2;Lvb2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lnb2;->a:Lqb2;

    .line 5
    .line 6
    iput-object p2, p0, Lnb2;->b:Lvb2;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Lqj0;
    .locals 2

    .line 1
    check-cast p1, Ljava/lang/Void;

    .line 2
    .line 3
    iget-object p1, p0, Lnb2;->a:Lqb2;

    .line 4
    .line 5
    iget-object v0, p1, Lqb2;->d:Lsa1;

    .line 6
    .line 7
    invoke-interface {v0}, Lsa1;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lv62;

    .line 12
    .line 13
    new-instance v1, Lpb2;

    .line 14
    .line 15
    iget-object p0, p0, Lnb2;->b:Lvb2;

    .line 16
    .line 17
    invoke-direct {v1, p1, p0}, Lpb2;-><init>(Lqb2;Lvb2;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lv62;->a(Lpb2;)Lj;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method
