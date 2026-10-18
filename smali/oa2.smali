.class public final synthetic Loa2;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/util/function/Function;


# instance fields
.field public final synthetic a:Le52;

.field public final synthetic b:Lu92;

.field public final synthetic c:Ls72;


# direct methods
.method public synthetic constructor <init>(Le52;Lu92;Ls72;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Loa2;->a:Le52;

    .line 5
    .line 6
    iput-object p2, p0, Loa2;->b:Lu92;

    .line 7
    .line 8
    iput-object p3, p0, Loa2;->c:Ls72;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    check-cast p1, Ljava/lang/String;

    .line 2
    .line 3
    new-instance p1, Lta2;

    .line 4
    .line 5
    iget-object v0, p0, Loa2;->a:Le52;

    .line 6
    .line 7
    iget-object v1, p0, Loa2;->b:Lu92;

    .line 8
    .line 9
    invoke-direct {p1, v0, v1}, Lta2;-><init>(Le52;Lu92;)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Lw92;

    .line 13
    .line 14
    invoke-direct {v0, p1}, Lw92;-><init>(Lta2;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Loa2;->c:Ls72;

    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    iput-boolean p1, p0, Ls72;->a:Z

    .line 21
    .line 22
    return-object v0
.end method
