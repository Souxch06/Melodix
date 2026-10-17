.class public final Lqs1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lsa1;


# static fields
.field public static final k:Lqs1;


# instance fields
.field public final j:Lva1;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lqs1;

    .line 2
    .line 3
    invoke-direct {v0}, Lqs1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lqs1;->k:Lqs1;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lrs1;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance v1, Lva1;

    .line 10
    .line 11
    invoke-direct {v1, v0}, Lva1;-><init>(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Lqs1;->j:Lva1;

    .line 15
    .line 16
    return-void
.end method

.method public static a()V
    .locals 1

    .line 1
    sget-object v0, Lqs1;->k:Lqs1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lqs1;->b()Lrs1;

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final b()Lrs1;
    .locals 0

    .line 1
    iget-object p0, p0, Lqs1;->j:Lva1;

    .line 2
    .line 3
    iget-object p0, p0, Lva1;->j:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p0, Lrs1;

    .line 6
    .line 7
    return-object p0
.end method

.method public final bridge synthetic get()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lqs1;->b()Lrs1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
