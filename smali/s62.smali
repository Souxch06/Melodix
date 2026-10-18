.class public final synthetic Ls62;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lka;


# static fields
.field public static final synthetic a:Ls62;


# direct methods
.method public static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ls62;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ls62;->a:Ls62;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Lqj0;
    .locals 2

    .line 1
    check-cast p1, Lx5;

    .line 2
    .line 3
    new-instance p0, Lq62;

    .line 4
    .line 5
    iget-object v0, p1, Lx5;->j:Lcom/google/android/gms/common/api/Status;

    .line 6
    .line 7
    iget v0, v0, Lcom/google/android/gms/common/api/Status;->j:I

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-direct {p0, v0, v1, p1}, Lq62;-><init>(ILjava/lang/String;Lx5;)V

    .line 14
    .line 15
    .line 16
    throw p0
.end method
