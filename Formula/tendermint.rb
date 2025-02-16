class Tendermint < Formula
  desc "BFT state machine replication for applications in any programming languages"
  homepage "https://tendermint.com/"
  url "https://github.com/tendermint/tendermint/archive/v0.35.8.tar.gz"
  sha256 "cadf322e5dd0c36e755cb04c431d5f3b5ecae791639f32f4f7c2637c947dcda0"
  license "Apache-2.0"
  head "https://github.com/tendermint/tendermint.git", branch: "master"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_monterey: "d96810dc765032fefd63d0ff4e0d70036a9c1a677050d24ceb64f2fd49ebc00c"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "d96810dc765032fefd63d0ff4e0d70036a9c1a677050d24ceb64f2fd49ebc00c"
    sha256 cellar: :any_skip_relocation, monterey:       "36e41368e202b6dacbbe1547f4bbfcd147244ca62d9417e2568b525721c891a2"
    sha256 cellar: :any_skip_relocation, big_sur:        "36e41368e202b6dacbbe1547f4bbfcd147244ca62d9417e2568b525721c891a2"
    sha256 cellar: :any_skip_relocation, catalina:       "36e41368e202b6dacbbe1547f4bbfcd147244ca62d9417e2568b525721c891a2"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "d4e040648cea9ad039cb7fc63ced03179fba1200ea0dc3feb25bddd26024e14c"
  end

  depends_on "go" => :build

  def install
    system "make", "build", "VERSION=#{version}"
    bin.install "build/tendermint"
  end

  test do
    mkdir(testpath/"staging")
    shell_output("#{bin}/tendermint init full --home #{testpath}/staging")
    assert_predicate testpath/"staging/config/genesis.json", :exist?
    assert_predicate testpath/"staging/config/config.toml", :exist?
    assert_predicate testpath/"staging/data", :exist?
  end
end
