.class public final Lhv1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:J

.field public final synthetic k:Lfw1;


# direct methods
.method public constructor <init>(Lfw1;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p2, p0, Lhv1;->j:J

    .line 5
    .line 6
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lhv1;->k:Lfw1;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lhv1;->k:Lfw1;

    .line 2
    .line 3
    iget-wide v1, p0, Lhv1;->j:J

    .line 4
    .line 5
    invoke-virtual {v0, v1, v2}, Lfw1;->r(J)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
